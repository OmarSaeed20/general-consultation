import '/index.dart';

class PusherRepositoryImp implements BasePusherRepository {
  final PusherRemoteDataSourceImp repo;
  PusherRepositoryImp(this.repo);

  @override
  ResultVoid initPusher() async =>
      executAndHandelError<void>(() => repo.initPusher());

  @override
  ResultVoid disconnectPusher() async =>
      executAndHandelError<void>(() => repo.disconnectPusher());

  @override
  ResultVoid subscribeToChat({required int chatId}) async =>
      executAndHandelError<void>(
        () => repo.subscribeToChat(chatId: chatId),
      );

  @override
  ResultVoid unsubscribeToChat({required int chatId}) async =>
      executAndHandelError<void>(() => repo.unsubscribeToChat(chatId: chatId));

  @override
  Stream<MessageEntity> listenToChat() => repo.listenToChat();
}
