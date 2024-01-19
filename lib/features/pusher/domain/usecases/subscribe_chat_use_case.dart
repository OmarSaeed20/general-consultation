import '/index.dart';

class SubscribeChatUseCase extends UseCaseWithParams<void, int> {
  final PusherRepositoryImp repo;

  SubscribeChatUseCase({required this.repo});

  @override
  ResultVoid call(int params) async =>
      await repo.subscribeToChat(chatId: params);
}
