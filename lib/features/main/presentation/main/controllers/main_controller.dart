import 'package:flutter/cupertino.dart';

import '/index.dart';
import 'main_state.dart';

abstract class MainController extends GetxController {
  void changePage({required int index});
}

class MainControllerImp extends MainController {
  MainControllerImp({required this.database});
  final AppPreferences database;

  final Rx<MainState> state = const MainState().obs;

  /*  @override
  void onInit() {
    super.onInit();
    UserServiceImp.to.init();
  } */

  Future<bool> onWillPop(BuildContext context) {
    if (state.value.currentIndex == 0) {
      DialogManager.showDialogWidget(
        title: Kstrings.alert.tr,
        subtitle: Kstrings.alertExitSup.tr,
        cancelText: Kstrings.cancel.tr,
        icon: CupertinoIcons.question_square,
        // img: Kimage.logout,
        confirmButton: Expanded(
          child: BtnWidget(
            title: Kstrings.confirm.tr,
            onTap: () => SystemNavigator.pop(),
            textStyle: gStyle14(
              color: KColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
      /* DialogManager.showAcceptDialog(
        "are you sure you want to exit app",
        // dialogType: DialogType.CONFIRMATION,
        context: context,
        onAccept: () => SystemNavigator.pop(),
      ); */
      return Future.value(true);
    } else {
      changePage(index: 0);
      return Future.value(false);
    }
  }

  @override
  void changePage({required int index}) {
    state(state.value.copyWith(currentIndex: index));
    switch (index) {
      case 0:
      // HomeBinding().dependencies();
      case 1:
        AllChatsBinding().dependencies();
      case 2:
        VideoBinding().dependencies();
        AdvertisementsBinding().dependencies();
      case 3:
        VipBinding().dependencies();
      case 4:
        AccountBinding().dependencies();
        ChooseLanguageBinding().dependencies();
        NotificationsBinding().dependencies();
    }
    /* 
    => switch (index) {
        0 => HomeBinding().dependencies(),
        1 => AllChatsBinding().dependencies(),
        2 => {
            AdvertisementsBinding().dependencies(),
            VideoBinding().dependencies(),
          },
        3 => VipBinding().dependencies(),
        4 => AccountBinding().dependencies(),
        _ => () {},
      };
     */
  }
}
