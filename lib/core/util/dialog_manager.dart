import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '/index.dart';

class DialogManager {
  static showSuccess(
    Widget widget, {
    BuildContext? context,
    EdgeInsetsGeometry? padding,
    DialogAnimation dialogAnimation = DialogAnimation.SLIDE_BOTTOM_TOP,
  }) {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    showInDialog(
      context ?? Get.context!,
      builder: (context) => widget,
      contentPadding: padding ?? gPadding(),
      dialogAnimation: dialogAnimation,
    );
  }

  static showAcceptDialog(
    String text, {
    required BuildContext context,
    EdgeInsetsGeometry? padding,
    DialogAnimation dialogAnimation = DialogAnimation.SCALE,
    required Function? onAccept,
  }) {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    showConfirmDialog(
      context,
      text,
      positiveText: Kstrings.ok.tr.capitalizeFirst!,
      negativeText: Kstrings.cancel.tr.capitalizeFirst!,
      /* 'Do you want to logout from the app?' */
      onAccept: onAccept,
    );
  }

  static showConfirmDialo(
    String text, {
    required BuildContext context,
    String? snackBarTitle,
    String? snackBarLabel,
    VoidCallback? onAccept,
    VoidCallback? onTap,
    EdgeInsetsGeometry? padding,
    DialogAnimation dialogAnimation = DialogAnimation.SCALE,
    DialogType dialogType = DialogType.DELETE,
  }) {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    showConfirmDialogCustom(
      context,
      title: text,
      dialogAnimation: dialogAnimation,
      dialogType: dialogType,
      positiveText: _getPositiveText(dialogType).capitalizeFirst,
      negativeText: Kstrings.cancel.tr.capitalizeFirst,
      onAccept: (context) {
        onAccept;
        /* snackBar(
          context,
          title: snackBarTitle ?? Kstrings.adDeleted.tr,
          snackBarAction: SnackBarAction(
            label: snackBarLabel ?? Kstrings.ok.tr,
            onPressed: onTap ?? () {},
          ),
        ); */
      },
    );
  }

  static showDialogWidget({
    required String title,
    required String subtitle,
    String? cancelText,
    IconData? icon,
    String? img,
    required Widget confirmButton,
  }) {
    Get.defaultDialog(
      radius: 4,
      barrierDismissible: false,
      title: '',
      contentPadding: gPadding(right: 15, left: 15),
      titlePadding: EdgeInsets.zero,
      content: Column(
        children: [
          if (!img.isEmptyOrNul)
            ImageWidget(
              path: img,
              color: KColors.redAccount,
              height: 45,
            )
          else
            Icon(
              icon ?? CupertinoIcons.delete,
              color: KColors.redAccount,
              size: 45.h,
            ),
          20.sH,
          TextWidget(
            title,
            style: gStyle16(fontWeight: FontWeight.w600),
          ),
          7.5.sH,
          TextWidget(
            subtitle,
            textAlign: TextAlign.center,
            style: gStyle16(
              color: KColors.textGray.withOpacity(0.6),
            ),
          ),
          40.sH,
          Row(
            children: [
              Expanded(
                child: BtnWidget(
                  title: cancelText ?? Kstrings.noKeepIt.tr,
                  textStyle:
                      gStyle14(fontSize: 15, fontWeight: FontWeight.w600),
                  backgroundColor: KColors.transparent,
                  titleColor: KColors.black,
                  border: Border.all(color: KColors.black),
                  onTap: () => Get.back(),
                ),
              ),
              10.width,
              confirmButton,
            ],
          ),
        ],
      ),
    );
  }
}

String _getPositiveText(DialogType? type) => switch (type) {
      DialogType.ACCEPT => Kstrings.accept.tr,
      DialogType.ADD => Kstrings.add.tr,
      DialogType.CONFIRMATION => Kstrings.confirm.tr,
      DialogType.DELETE => Kstrings.delete.tr,
      DialogType.UPDATE => Kstrings.update.tr,
      DialogType.RETRY => Kstrings.retry.tr,
      _ => Kstrings.ok.tr,
    };
