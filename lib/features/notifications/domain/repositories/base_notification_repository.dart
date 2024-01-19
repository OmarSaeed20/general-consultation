import '/index.dart';

abstract class BaseNotificationRepository {
  ResultFuture<NotificationModel> getNotification(PageOnlyParameter parameter);
  ResultFuture<AuthenticationModel> blockNotification();
  ResultFuture<CountUnreadModel> countUnreadNotifications();
}
