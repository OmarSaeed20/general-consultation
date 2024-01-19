import '/index.dart';

class ListenToChatUseCase {
  final PusherRepositoryImp repo;

  ListenToChatUseCase({required this.repo});

  Stream<MessageEntity> call() => repo.listenToChat();
}
