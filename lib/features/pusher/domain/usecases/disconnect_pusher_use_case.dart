import '/index.dart';

class DisconnectPusherUseCase extends UseCaseWithoutParams<void> {
  final PusherRepositoryImp repo;
  DisconnectPusherUseCase({required this.repo});

  @override
  ResultVoid call() async => await repo.disconnectPusher();
}
