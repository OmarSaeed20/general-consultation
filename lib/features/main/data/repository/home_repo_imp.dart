import '/features/main/data/model/home_model.dart';
import '/features/main/domain/repository/home_repository.dart';

import '/index.dart';

class HomeRepositoryImp implements BaseHomeRepository {
  HomeRepositoryImp(this._remoteData, this._preferences);
  final HomeClient _remoteData;
  final AppPreferences _preferences;

  @override
  ResultFuture<HomeModel> getHome() async => executAndHandelError<HomeModel>(
        () => _remoteData.getHome(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<ContactUsModel> deleteAccount() async =>
      executAndHandelError<ContactUsModel>(
        () => _remoteData.deleteAccount(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );

  @override
  ResultFuture<ContactUsModel> logOut() async =>
      executAndHandelError<ContactUsModel>(
        () => _remoteData.logout(
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
  @override
  ResultFuture<ContactUsModel> sendComplaint(
    SendComplaintParameter parameter,
  ) async =>
      executAndHandelError<ContactUsModel>(
        () => _remoteData.sendComplaint(
          categoryId: parameter.categoryId,
          content: parameter.content,
          file: parameter.image,
          token: _preferences.getToken,
          lang: _preferences.getLang,
        ),
      );
}
