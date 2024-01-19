import '/index.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatControllerImp>(
      () => ChatControllerImp(
        getChatByVendorUseCase: Get.find<GetChatByVendorUseCase>(),
        sendMessageUseCase: Get.find<SendMessageUseCase>(),
        initPusherUseCase: Get.find<InitPusherUseCase>(),
        subscribeChatUseCase: Get.find<SubscribeChatUseCase>(),
        unsubscribeChatUseCase: Get.find<UnSubscribeChatUseCase>(),
        listenToChatUseCase: Get.find<ListenToChatUseCase>(),
        allChatsCtrl: Get.find<AllChatsControllerImp>(),
      ),
    );
  }
}
