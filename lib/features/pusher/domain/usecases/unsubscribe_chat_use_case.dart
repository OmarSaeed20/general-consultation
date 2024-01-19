import '/index.dart';

class UnSubscribeChatUseCase extends UseCaseWithParams<void, int> {
  UnSubscribeChatUseCase({required this.repo});
  final PusherRepositoryImp repo;

  @override
  ResultVoid call(int params) async =>
      await repo.unsubscribeToChat(chatId: params);
}
