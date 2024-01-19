import 'package:general_consultation/index.dart';

import 'components/notification_card.dart';

class NotificationsView extends GetView<NotificationsControllerImp> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    // controller.getAllNotifications();
    return Scaffold(
      appBar: BuildAppBar(title: Kstrings.notifications.tr),
      body: Obx(
        () => HandlingRequstView(
          controller.state.value.rx,
          padding: gPadding(bottom: 60),
          loading: LoadingViewNotification(controller: controller),
          onTap: () => controller.getAllNotifications(),
          child: LoadingViewNotification(controller: controller),
        ),
      ),
      /* /* controller.allNotifcation == null
              ? const SizedBox.shrink()
              : controller.allNotifcation!.data.isEmpty
                  ? Center(
                      child: TextWidget(
                        Kstrings.emptyNotification.tr,style: gStyle18(),
                      ),
                    )
                  : */
              ListView.separated(
            controller: controller.state.value.scrollController,
            itemBuilder: (context, index) => NotificationCard(
              notification: controller.state.value.notifications[index],
            ),
            itemCount: controller.state.value.notifications.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(thickness: 1, color: Colors.grey[300]),
          ), */
    );
  }
}

class LoadingViewNotification extends StatelessWidget {
  const LoadingViewNotification({super.key, required this.controller});
  final NotificationsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        controller: controller.state.value.scrCtrl,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.state.value.rx.isLoading
            ? 25
            : controller.state.value.notifications.length,
        itemBuilder: (context, i) => AnimationListWidget(
          index: i,
          milliseconds: 350,
          // horizontal: 25,
          vertical: 30,
          child: controller.state.value.rx.isLoading
              ? const _LaodingBody()
              : NotificationCard(
                  notification: controller.state.value.notifications[i],
                ),
        ),
      ),
    );
  }
}

class _LaodingBody extends StatelessWidget {
  const _LaodingBody();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: BeveledRectangleBorder(
        side: BorderSide(color: KColors.fillBorder, width: .3.w),
      ),
      isThreeLine: false,
      leading: ShimmerWidget(
        child: Container(
          height: 42.h,
          width: 42.h,
          decoration: const BoxDecoration(
            color: KColors.fillColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
      title: Padding(
        padding: gPadding(top: 10),
        child: ShimmerWidget(
          child:
              Container(height: 8.4.h, width: 100.w, color: KColors.fillColor),
        ),
      ),
    );
  }
}
