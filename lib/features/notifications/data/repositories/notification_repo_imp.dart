import '/index.dart';

class NotificationRepositoryImp implements BaseNotificationRepository {
  NotificationRepositoryImp(this._remoteData, this._preferences);
  final NotificationClient _remoteData;
  final AppPreferences _preferences;

  @override
  ResultFuture<NotificationModel> getNotification(
    PageOnlyParameter parameter,
  ) async =>
      executAndHandelError<NotificationModel>(
        () => _remoteData.notifications(
          page: parameter.page,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
  @override
  ResultFuture<AuthenticationModel> blockNotification() async =>
      executAndHandelError<AuthenticationModel>(
        () => _remoteData.blockNotification(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<CountUnreadModel> countUnreadNotifications() async =>
      executAndHandelError<CountUnreadModel>(
        () => _remoteData.countUnreadNotifications(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
}
