import 'package:flutter/cupertino.dart';

import '/index.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BuildAccountHeader(),
              _BuildAccountBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildAccountBody extends StatelessWidget {
  const _BuildAccountBody();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountControllerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserDataCard(),
          22.sH,
          listTile2(
            title: Kstrings.accountS,
            img: Kimage.user2,
            onTap: () => Get.toNamed(Routes.profile),
          ),
          listTile2(
            title: Kstrings.editPassword,
            img: Kimage.lock2,
            onTap: () => Get.toNamed(Routes.changePassword),
          ),
          listTile2(
            title: Kstrings.createAds,
            img: Kimage.sortIcon,
            onTap: () => Get.toNamed(Routes.createAds),
          ),
          listTile2(
            title: Kstrings.myAds,
            img: Kimage.sortIcon,
            onTap: () => Get.toNamed(Routes.myAllAds),
          ),
          listTile2(
            title: Kstrings.customerInquiries,
            img: Kimage.questionMark,
            onTap: () => Get.toNamed(Routes.customerInquiriesView),
          ),
          Obx(
            () => listTile2(
              title: Kstrings.notifications,
              img: Kimage.bell,
              isOff: UserServiceImp.to.currentUser.value?.blockNotification ??
                  false,
              onChanged: (_) =>
                  Get.find<NotificationsControllerImp>().blockNotifications(),
              onTap: () async {
                Get.toNamed(Routes.notifications);
                await Get.find<NotificationsControllerImp>()
                    .getAllNotifications();
              },
            ),
          ),
          /* listTile2(
            title: Kstrings.notifications,
            img: Kimage.bell,
            onTap: () => NotificationsControllerImp.to.blockNotifications(),
          ), */
          listTile2(
            title: Kstrings.aboutApp,
            img: Kimage.exclamation,
            onTap: () => Get.toNamed(Routes.aboutUsView),
          ),
          /* listTile2(
            title: Kstrings.privacyPolicy,
            img: Kimage.exclamation,
            onTap: () => Get.toNamed(Routes.privacy),
          ),
          listTile2(
            title: Kstrings.termsAndConditions,
            img: Kimage.exclamation,
            onTap: () => Get.toNamed(Routes.terms),
          ), */
          listTile2(
            title: Kstrings.contactUs,
            img: Kimage.chatAlt,
            onTap: () => Get.toNamed(Routes.contactUsView),
          ),
          Obx(
            () => listTile2(
              title: Kstrings.lang,
              img: Kimage.chatAlt,
              lang: Get.find<ChooseLanguageControllerImp>().state.value.lang,
              onTap: () => Get.toNamed(Routes.choseLanguage),
            ),
          ),
          listTile2(
            title: Kstrings.logout,
            img: Kimage.logout,
            onTap: () => DialogManager.showDialogWidget(
              title: Kstrings.alert.tr,
              subtitle: Kstrings.alertLogoutSup.tr,
              cancelText: Kstrings.cancel.tr,
              icon: Icons.logout,
              img: Kimage.logout,
              confirmButton: Obx(
                () => Expanded(
                  child: BtnWidget(
                    title: Kstrings.confirm.tr,
                    onTap: () => controller.logout(),
                    rx: controller.state.value.rx,
                    textStyle: gStyle14(
                      color: KColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  listTile2({
    required String title,
    required String img,
    String? lang,
    required void Function() onTap,
    bool isOff = true,
    Function(bool value)? onChanged,
  }) =>
      ListTile(
        contentPadding: gPadding(right: 16),
        onTap: img == Kimage.notificationIcon ? null : onTap,
        shape: LinearBorder.top(
          side: BorderSide(width: .3.w, color: const Color(0xFFDBDBDB)),
        ),
        title: TextWidget(title.tr),
        trailing: Padding(
          padding: gPadding(left: img == Kimage.bell ? 12 : 20),
          child: img == Kimage.bell
              ? Padding(
                  padding: gPadding(left: 10),
                  child: Switch.adaptive(
                    value: isOff,
                    onChanged: onChanged,
                    activeColor: KColors.primary,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title == Kstrings.lang) ...[TextWidget(lang?.tr), 4.sW],
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.h,
                      color: const Color(0xFF111827),
                    ),
                  ],
                ),
        ),
        leading: CircleAvatar(
          backgroundColor: title == Kstrings.logout
              ? KColors.red.withOpacity(.2)
              : KColors.fillColor2,
          child: switch (title) {
            Kstrings.termsAndConditions => const Icon(Icons.create_outlined),
            Kstrings.createAds => const Icon(Icons.create_outlined),
            Kstrings.lang => const Icon(CupertinoIcons.globe),
            _ => ImageWidget(path: img, fit: BoxFit.cover),
          }
          /* title == Kstrings.createAds
              ? const Icon( Icons.create_outlined)
              : ImageWidget(path: img, fit: BoxFit.cover) */
          ,
        ),
      );
}

class UserDataCard extends StatelessWidget {
  const UserDataCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: UserServiceImp.to.currentUser.value != null,
        child: ListTile(
            contentPadding: gPaddingSymmetric(horizontal: 16),
            title: TextWidget(
              (UserServiceImp.to.currentUser.value?.name).valide(),
              style: gStyle14(fontWeight: FontWeight.w600),
            ),
            subtitle: TextWidget(
              (UserServiceImp.to.currentUser.value?.email).valide(),
              style: gStyle14(color: KColors.textGray2),
            ),
            leading: CircleImageNetWork(
              url: UserServiceImp.to.currentUser.value?.image,
              size: 48,
            )),
      ),
    );
  }
}

class _BuildAccountHeader extends StatelessWidget {
  const _BuildAccountHeader();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: gPadding(right: 16),
      title: AuthHeader(
        title: Kstrings.myAccount.tr,
        supTitle: const SizedBox.shrink(),
        padding: gPadding(),
        padLef: 0,
      ),
      trailing: const NotificationIconWidget(),
    );
  }
}
