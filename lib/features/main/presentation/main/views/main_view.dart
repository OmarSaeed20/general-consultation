import '/index.dart';

class MainView extends GetView<MainControllerImp> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      // ignore: deprecated_member_use
      () => WillPopScope(
        onWillPop: () => controller.onWillPop(context),
        child: Scaffold(
          body: controller.state.value.pages
              .elementAt(controller.state.value.currentIndex),
          bottomNavigationBar: const _BottomNavigationBar(),
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends GetView<MainControllerImp> {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: .5, color: KColors.fillBorder),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: context.width < 350
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ...List.generate(
                  controller.state.value.pages.length,
                  (i) => CustomMaterialButton(
                    text: controller.state.value.titl[i].tr,
                    onTap: () => controller.changePage(index: i),
                    img: controller.state.value.currentIndex == i
                        ? controller.state.value.icons2[i]
                        : controller.state.value.icons1[i],
                    isActive: controller.state.value.currentIndex == i,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
