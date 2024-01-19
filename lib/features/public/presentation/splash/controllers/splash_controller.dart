import 'dart:async';

import '/index.dart';

class SplashController extends GetxController {
  final AppPreferences preferences;

  SplashController(this.preferences);
// if (await Get.find<NetworkInfo>().isConnected == true)
  navigate() async =>
      switch (await Get.find<NetworkInfo>().isConnected == true) {
        true => switch (preferences.isLogin) {
            true => Get.offAllNamed(Routes.main),
            false => Get.offAllNamed(Routes.choseLanguage),
          },
        false => {
            if (preferences.isLogin)
              {
                ToastManager.showError("No Connection !!".tr),
                preferences.logout(),
                Get.offAllNamed(Routes.login),
              }
            else
              Get.offAllNamed(Routes.choseLanguage),
          },
      };

  @override
  void onReady() async {
    Timer(const Duration(seconds: 2), () async => await navigate());
    super.onReady();
  }
}
