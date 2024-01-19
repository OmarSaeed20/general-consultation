import '/index.dart';

abstract class BasePusherRepository {
  ResultVoid initPusher();

  ResultVoid disconnectPusher();

  ResultVoid subscribeToChat({required int chatId});

  ResultVoid unsubscribeToChat({required int chatId});

  Stream<MessageEntity> listenToChat();
}
