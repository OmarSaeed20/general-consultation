import 'dart:async';
import 'dart:io';

import '/index.dart';

class ChatState extends Equatable {
  const ChatState({
    this.chat,
    this.rx = RequestState.none,
    this.rxsend = RequestState.none,
    this.messages = const [],
    required this.msgCtrl,
    required this.recCtrl,
    required this.scrCtrl,
    required this.vendorId,
    required this.vendorImage,
    required this.vendorName,
    this.chatId,
    this.timer,
    this.counter = 0,
    this.currentPage = 1,
    this.imgHeight = 0,
    this.imgHeightAction = 0,
    this.recHeightAction = 0,
    this.image,
    this.voice,
    this.isEmpty,
    this.isRecording = false,
    this.isRecordDraft = false,
    this.isImageDraft = false,
    this.showSend = false,
  });
  final GetChatByVendorModel? chat;
  final List<MessageEntity> messages;
  final RequestState rx, rxsend;
  final TextEditingController msgCtrl;
  final ScrollController scrCtrl;
  final RecorderController recCtrl;
  final Rx<File?>? image, voice;
  final bool isRecording, isRecordDraft, isImageDraft,showSend;
  final int? chatId;
  final Timer? timer;
  final int counter;
  final double imgHeight, imgHeightAction, recHeightAction;
  final int vendorId, currentPage;
  final String vendorName, vendorImage;
  final Rx<bool>? isEmpty;

  ChatState copyWith({
    GetChatByVendorModel? chat,
    int? chatId,
    Timer? timer,
    int? counter,
    int? vendorId,
    String? vendorImage,
    String? vendorName,
    List<MessageEntity>? messages,
    RequestState? rx,
    RequestState? rxsend,
    String? msgCtrl,
    ScrollController? scrCtrl,
    int? currentPage,
    int? lastPage,
    double? imgHeight,
    double? recHeightAction,
    double? imgHeightAction,
    Rx<File?>? image,
    Rx<File?>? voice,
    bool? isRecording,
    bool? isRecordDraft,
    bool? isImageDraft,
    bool? showSend,
    Rx<bool>? isEmpty,
    RecorderController? recCtrl,
  }) =>
      ChatState(
        showSend: showSend ?? this.showSend,
        recHeightAction: recHeightAction ?? this.recHeightAction,
        imgHeightAction: imgHeightAction ?? this.imgHeightAction,
        imgHeight: imgHeight ?? this.imgHeight,
        isImageDraft: isImageDraft ?? this.isImageDraft,
        isRecordDraft: isRecordDraft ?? this.isRecordDraft,
        recCtrl: recCtrl ?? this.recCtrl,
        vendorName: vendorName ?? this.vendorName,
        vendorImage: vendorImage ?? this.vendorImage,
        vendorId: vendorId ?? this.vendorId,
        chatId: chatId ?? this.chatId,
        timer: timer ?? this.timer,
        counter: counter ?? this.counter,
        chat: chat ?? this.chat,
        currentPage: currentPage ?? this.currentPage,
        messages: messages ?? this.messages,
        rx: rx ?? this.rx,
        rxsend: rxsend ?? this.rxsend,
        msgCtrl: this.msgCtrl.copyWith(text: msgCtrl),
        scrCtrl: scrCtrl ?? this.scrCtrl,
        image: image ?? this.image,
        voice: voice ?? this.voice,
        isRecording: isRecording ?? this.isRecording,
        isEmpty: isEmpty ?? this.isEmpty,
      );
  @override
  List<Object?> get props => [
        showSend,
        recHeightAction,
        imgHeightAction,
        imgHeight,
        recCtrl,
        isImageDraft,
        isRecordDraft,
        chat,
        messages,
        msgCtrl,
        currentPage,
        rx,
        rxsend,
        scrCtrl,
        image,
        voice,
        isRecording,
        isEmpty,
        chatId,
        timer,
        counter,
        vendorId,
        vendorName,
        vendorImage,
      ];
}
