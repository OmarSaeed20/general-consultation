import 'package:general_consultation/index.dart';

class GetNotificationUseCase
    extends UseCaseWithParams<NotificationModel, PageOnlyParameter> {
  final NotificationRepositoryImp _repo;

  GetNotificationUseCase(this._repo);
  @override
  ResultFuture<NotificationModel> call(PageOnlyParameter params) =>
      _repo.getNotification(params);
}


