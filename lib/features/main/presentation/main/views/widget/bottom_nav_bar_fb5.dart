import '/index.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.onTap,
    required this.img,
    required this.text,
    required this.isActive,
  });
  final VoidCallback onTap;
  final String img;
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isActive
              ? ImageWidget(
                      path: img, height: /*  context.width < 350 ? 18 : */ 22)
                  .animate()
                  .fadeIn(curve: Curves.easeInOutCirc)
                  .scaleX()
                  .shimmer(delay: const Duration(milliseconds: 500))
                  .scale(delay: const Duration(milliseconds: 100))
              : ImageWidget(
                  path: img, height: /* context.width < 350 ? 18 : */ 22),
          TextWidget(
            text,
            style: isActive
                ? gStyle14(
                    color: KColors.primary,
                    fontSize: /* context.width < 350 ? 10 : */ 13)
                : gStyle14(
                    color: KColors.textGray,
                    fontSize: /* context.width < 350 ? 9 : */ 12),
          )
        ],
      ),
    );
  }
}

class NotificationIconWidget extends GetView<NotificationsControllerImp> {
  const NotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ctrl.countUnread();
    // print(controller.state.value.countUnread);
    return Obx(
      () => Stack(
        children: [
          ImageWidget(
            onTap: () async {
              Get.toNamed(Routes.notifications);
              await controller.getAllNotifications();
            },
            path: Kimage.notificationIcon,
          ),
          Visibility(
            visible: controller.state.value.countUnread != 0,
            child: Positioned(
              top: 3.h,
              right: 10.w,
              child: CircleAvatar(
                radius: 10,
                child: TextWidget(
                  controller.state.value.countUnread.toString(),
                ),
              ).animate().slide().shake(),
            ),
          )
        ],
      ),
    );
  }
}
