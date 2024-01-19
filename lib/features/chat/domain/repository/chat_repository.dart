import '/index.dart';

abstract class BaseChatRepository {
  ResultFuture<AllChatsModel> getAllChats(
      {required AllChatsParameter parameter});
  ResultFuture<GetChatByVendorModel> getChatByVendor(ChatParameter params);
  ResultFuture<MessageModel> sendMessage(SendMessageParameter params);
}
