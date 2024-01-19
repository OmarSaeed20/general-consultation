import 'dart:async';

import '/index.dart';

/* 
abstract class UserService extends GetxService {
  Future<UserServiceImp> init();
  Future<void> getUser();
} */

class UserServiceImp extends GetxService {
  UserServiceImp({required this.getUserUseCase});
  final GetUserUseCase getUserUseCase;

  static UserServiceImp get to => Get.find<UserServiceImp>();

  Rx<AuthenticationEntity?> currentUser = Rx(null);
  Rx<List<CategoriesEntity>> categories = Rx([]);
  Rx<List<SubCategoryEntity>> supCategories = Rx([]);
  /* @override
  void onInit() {
    init();
    super.onInit();
  } */

  Future<UserServiceImp> init() async {
    if (await Get.find<NetworkInfo>().isConnected == true) {
      if (Get.find<AppPreferences>().isLogin && currentUser.value == null) {
        await getUser();
      }
    }

    currentUser.listen((value) async {
      if (value != null) {
        Get.find<AppPreferences>().setToken(value.token);
      }
    });
    return this;
  }

  Future<void> getUser() async {
    final result = await getUserUseCase();
    result.when(
      failure: (e) =>
          ToastManager.showError(NetworkExceptions.getErrorMessage(e)),
      success: (user) async => currentUser.value = user.data,
    );
  }
}
