import '/index.dart';

class InitPusherUseCase extends UseCaseWithoutParams<void> {
  InitPusherUseCase({required this.repo});
  final PusherRepositoryImp repo;

  @override
  ResultVoid call() async => await repo.initPusher();
}
