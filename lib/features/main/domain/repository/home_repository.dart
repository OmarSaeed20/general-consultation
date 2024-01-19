import '/features/main/data/model/home_model.dart';

import '/index.dart';

abstract class BaseHomeRepository {
  ResultFuture<HomeModel> getHome();
  ResultFuture<ContactUsModel> logOut();
  ResultFuture<ContactUsModel> deleteAccount();

  ResultFuture<ContactUsModel> sendComplaint(SendComplaintParameter parameter);
}
