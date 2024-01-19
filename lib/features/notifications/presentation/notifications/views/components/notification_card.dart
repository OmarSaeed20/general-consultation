import 'package:general_consultation/index.dart';


class NotificationCard extends GetView<NotificationsControllerImp> {
  const NotificationCard({super.key, required this.notification});

  final NotificationData notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: .5, color: KColors.fillBorder),
      ),
      child: ListTile(
        onTap: () {
          /* if (notification.userType == UserType.buyer) {
            // if (notification.model == NotificationType.offer) {
              // Routes.chatPage(vendor);
            // }
          } else {
            switch (notification.model) {
              case NotificationType.order:
              case NotificationType.offer:
                if (notification.notificationParams?.serviceType ==
                    ServiceType.spareParts) {
                  Get.toNamed(
                    Routes.sparePartsRequestVendorView,
                    arguments: {
                      'order_id': notification.notificationParams?.orderId
                    },
                  );
                } else {
                  Get.toNamed(
                    Routes.otherRequestVendorView,
                    arguments: {
                      "order_id": notification.notificationParams?.orderId
                    },
                  );
                }
                break;
              default:
            }
          } */
        },
        /* shape: LinearBorder.top(
          side: BorderSide(width: .3.w, color: const Color(0xFFDBDBDB)),
        ), */
        contentPadding: gPaddingSymmetric(horizontal: 16),
        dense: true,
        leading: Container(
            height: 42.h,
            width: 42.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: .3.w, color: KColors.fillBorder),
            ),
            child: Icon(getIcon(notification.type), color: KColors.primary)),
        title: TextWidget(notification.content, style: gStyle16()),
      ),
    );
  }
}

NotificationType checkNotifcationType(String notificationType) =>
    switch (notificationType) {
      'message' => NotificationType.message,
      _ => NotificationType.welcome,
    };
getIcon(String notificationType) =>
    switch (checkNotifcationType(notificationType)) {
      NotificationType.welcome => Icons.star_border_rounded,
      _ => Icons.notifications_active_outlined,
    };
