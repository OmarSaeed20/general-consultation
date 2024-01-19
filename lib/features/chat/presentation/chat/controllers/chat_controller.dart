import 'dart:async';
import 'dart:io';

// import 'package:audio_waveforms/audio_waveforms.dart';
// import 'package:audio_waveforms/record_audio_waveform.dart';
// import 'package:audio_waveforms/record_audio_waveforms.dart';
import '/index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:record/record.dart';
import 'package:uuid/uuid.dart';

import 'chat_state.dart';

abstract class ChatController extends GetxController {
  Future<void> toggleRecorder();
  Future<void> startRecord();
  Future<void> stopRecorder();
  Future<void> pickImage();
  void removeImage();
  void startTimerCountDown();
  // void expandImage(double height);
  Future<void> removeRecorder();
  Future<void> sendMessage();
  Future<void> listenToChat();
}

class ChatControllerImp extends ChatController {
  final GetChatByVendorUseCase getChatByVendorUseCase;
  final InitPusherUseCase initPusherUseCase;
  final SubscribeChatUseCase subscribeChatUseCase;
  final ListenToChatUseCase listenToChatUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final UnSubscribeChatUseCase unsubscribeChatUseCase;
  final AllChatsControllerImp allChatsCtrl;
  ChatControllerImp({
    required this.getChatByVendorUseCase,
    required this.sendMessageUseCase,
    required this.initPusherUseCase,
    required this.subscribeChatUseCase,
    required this.unsubscribeChatUseCase,
    required this.listenToChatUseCase,
    required this.allChatsCtrl,
  });

  final Rx<ChatState> state = ChatState(
    recCtrl: RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000,
    vendorId: Get.arguments["vendor_id"],
    vendorImage: Get.arguments["vendor_image"],
    vendorName: Get.arguments["vendor_name"],
    scrCtrl: ScrollController(),
    msgCtrl: TextEditingController(),
    // record: Record(),
    isEmpty: true.obs,
  ).obs;

  @override
  Future<void> toggleRecorder() async => switch (state.value.isRecording) {
        true => stopRecorder(),
        false => startRecord(),
      };

  @override
  Future<void> startRecord() async {
    await _openTheRecorder();
    startTimerCountDown();
    String uniqueKey = const Uuid().v4() +
        DateTime.now().toIso8601String().replaceAll('.', '-');
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    state(state.value.copyWith(voice: File('$tempPath/$uniqueKey.m4a').obs));
    if (state.value.image != null) if (state.value.isImageDraft) removeImage();
    state.value.recCtrl
        .record(path: state.value.voice?.value?.path)
        .then((_) async {
      state(state.value.copyWith(isRecording: true));
    }).onError((error, _) {
      if (state.value.timer?.isActive == true) state.value.timer?.cancel();
      state(state.value.copyWith(isRecording: false));
    });
  }

  Future<void> _openTheRecorder() async {
    PermissionStatus status = await Permission.microphone.request();
    if (status != PermissionStatus.granted &&
        await state.value.recCtrl.checkPermission()) {
      throw 'Microphone permission not granted';
    }
  }

  @override
  Future<void> stopRecorder() async {
    await state.value.recCtrl.stop();
    if (state.value.timer?.isActive == true) state.value.timer?.cancel();
    state(state.value.copyWith(
      isRecording: false,
      isRecordDraft: true,
      recHeightAction: 60,
    ));
  }

  @override
  void startTimerCountDown() {
    state(state.value.copyWith(counter: 0));
    const second = Duration(seconds: 1);
    state(
      state.value.copyWith(
        timer: Timer.periodic(
          second,
          (Timer timer) {
            state(state.value.copyWith(counter: state.value.counter + 1));
          },
        ),
      ),
    );
  }

  @override
  Future<void> removeRecorder() async {
    await state.value.recCtrl.stop();
    state(state.value.copyWith(
      isRecording: false,
      isRecordDraft: false,
      recHeightAction: 0,
      voice: null.obs,
    ));
  }

  @override
  Future<void> pickImage() async {
    File? resultImg = await Utils.pickPicture();
    if (resultImg != null) {
      if (state.value.isRecordDraft) {
        state(state.value.copyWith(voice: null.obs, isRecordDraft: false));
      }
      state(state.value.copyWith(
        image: resultImg.obs,
        isImageDraft: true,
        imgHeightAction: 60,
        imgHeight: Get.context!.size!.height / 2,
      ));
      // expandImage(Get.context!.size!.height / 2);
    }
  }

  @override
  void removeImage() => state(state.value.copyWith(
        image: null.obs,
        isImageDraft: false,
        imgHeight: 0,
        imgHeightAction: 0,
      ));
  /* @override
  void expandImage(double height) {
    if (state.value.imgHeight == Get.context!.size!.height / 1.5) {
      state(state.value.copyWith(imgHeight: 250));
    } else {
      state(state.value.copyWith(imgHeight: height));
    }
  } */

  @override
  Future<void> sendMessage() async {
    if (state.value.msgCtrl.text.isEmpty &&
        state.value.image?.value == null &&
        state.value.voice?.value == null) return;
    if (state.value.rxsend.isLoading) return;

    state(state.value.copyWith(rxsend: RequestState.loading));
    var sendMessageParameter = state.value.image?.value != null
        ? SendMessageParameter(
            chatId: state.value.chatId!,
            message: null,
            voice: null,
            image: state.value.image?.value,
          )
        : SendMessageParameter(
            chatId: state.value.chatId!,
            message: state.value.msgCtrl.text.isEmptyOrNul
                ? null
                : state.value.msgCtrl.text,
            voice: state.value.voice?.value,
            image: null,
          );
    ApiResult<MessageModel> result =
        await sendMessageUseCase(sendMessageParameter);

    result.when(
      failure: (failure) =>
          state(state.value.copyWith(rxsend: handleRxError(failure))),
      success: (result) async {
        ////
        state.value.scrCtrl.animateTo(
          (state.value.messages.isNotEmpty ? 0 : 1) * Get.height,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 300),
        );

        state(
          state.value.copyWith(
            imgHeight: 0,
            recHeightAction: 0,
            imgHeightAction: 0,
            isRecordDraft: false,
            isImageDraft: false,
            msgCtrl: "",
            showSend: true,
            image: null.obs,
            voice: null.obs,
            rxsend: RequestState.success,
          ),
        );
        await allChatsCtrl.getChats();
        ////
        //debugPrint("result =====> ${state.value.messages}");
      },
    );
  }

  Future<void> _getMessages({required int vendorId, int? page}) async {
    state(
      state.value.copyWith(
        rx: handleRxLoading(page: page ?? state.value.currentPage),
      ),
    );

    //debugPrint("currentPage is ${state.value.currentPage}");
    ApiResult<GetChatByVendorModel> result = await getChatByVendorUseCase(
      ChatParameter(vendorId: vendorId, page: page ?? state.value.currentPage),
    );

    result.when(
      failure: (failure) => state(
        state.value.copyWith(rx: handleRxError(failure)),
      ),
      success: (result) {
        state(state.value.copyWith(chat: result, chatId: result.data?.chat.id));
        state(
          state.value.copyWith(
            messages: handlePagenationResponse<MessageEntity>(
              responselist: result.data!.messages.messages,
              currentList: state.value.messages,
              currentPage: state.value.currentPage,
            ),
            rx: handleRxList<MessageEntity>(result.data!.messages.messages),
          ),
        );
      },
    );
  }

  Future<void> _scrollListener() async {
    MessagesData message = state.value.chat!.data!.messages;
    handleScrListener(
      scrCtrl: state.value.scrCtrl,
      current: message.currentPage,
      last: message.lastPage,
      fun: () async {
        state(state.value.copyWith(currentPage: message.currentPage + 1));
        await _getMessages(vendorId: state.value.vendorId);
      },
    );
  }

  @override
  Future<void> listenToChat() async {
    listenToChatUseCase().listen(
      (MessageEntity realTimeChat) async {
        List<MessageEntity> res = state.value.messages..insert(0, realTimeChat);
        state(state.value.copyWith(messages: res));
        //debugPrint('realTimeChat =========> $realTimeChat');
        state.value.scrCtrl.animateTo(
          (state.value.messages.isNotEmpty ? 0 : 1) * Get.height,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 300),
        );
      },
    );
  }


  @override
  void onInit() async {
    if (Get.previousRoute == Routes.main) {
      state(state.value.copyWith(chatId: Get.arguments["chat_id"]));
    }
    await initPusherUseCase();
    await _getMessages(vendorId: state.value.vendorId);
    state.value.scrCtrl.addListener(_scrollListener);
    {
      await subscribeChatUseCase(state.value.chatId!);
      await listenToChat();
    }
    super.onInit();
  }

  @override
  void onClose() async {
    super.onClose();
    // removeRecorder();
    state.value.recCtrl.dispose();
    // await state.value.record.dispose();
    await unsubscribeChatUseCase(state.value.chatId!)
        .then((value) {} //debugPrint("unsubscribeChat dispose =====> $value")
            );
    state.value.msgCtrl.dispose();
    handleDisposeScrAndRefCtrl(
      scrCtrl: state.value.scrCtrl,
      fun: _scrollListener,
    );
  }
}
