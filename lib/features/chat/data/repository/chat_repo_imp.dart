import '/features/chat/domain/repository/chat_repository.dart';
import '/index.dart';

class ChatRepositoryImp implements BaseChatRepository {
  ChatRepositoryImp(this._remoteData, this._preferences);
  final ChatClient _remoteData;
  final AppPreferences _preferences;

  @override
  ResultFuture<AllChatsModel> getAllChats({
    required AllChatsParameter parameter,
  }) async =>
      executAndHandelError<AllChatsModel>(
        () => _remoteData.getChat(
          page: parameter.page,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<GetChatByVendorModel> getChatByVendor(
    ChatParameter params,
  ) async =>
      executAndHandelError<GetChatByVendorModel>(
        () => _remoteData.getChatByVendor(
          page: params.page,
          vendorId: params.vendorId,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<MessageModel> sendMessage(SendMessageParameter params) async =>
      executAndHandelError<MessageModel>(
        () => _remoteData.sendMessage(
          chatId: params.chatId,
          message: params.message,
          file: params.image,
          audio: params.voice,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
}
