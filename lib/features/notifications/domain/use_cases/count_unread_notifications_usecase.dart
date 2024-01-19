import 'package:general_consultation/index.dart';

class CountUnreadNotificationsUseCase
    extends UseCaseWithoutParams<CountUnreadModel> {
  final NotificationRepositoryImp _repo;

  CountUnreadNotificationsUseCase(this._repo);
  @override
  ResultFuture<CountUnreadModel> call() => _repo.countUnreadNotifications();
}
