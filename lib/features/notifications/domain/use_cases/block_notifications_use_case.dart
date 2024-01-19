import 'package:general_consultation/index.dart';

class BlockNotificationUseCase
    extends UseCaseWithoutParams<AuthenticationModel> {
  final NotificationRepositoryImp _repo;

  BlockNotificationUseCase(this._repo);
  @override
  ResultFuture<AuthenticationModel> call() => _repo.blockNotification();
}


