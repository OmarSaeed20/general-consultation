import '/index.dart';
import 'widget/all_chat_card.dart';

class AllChatsView extends GetView<AllChatsControllerImp> {
  const AllChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final listenable = IndicatorStateListenable();
    return Scaffold(
      appBar: BuildAppBar(
        title: Kstrings.msgs.tr,
        centerTitle: false,
        actions: const [NotificationIconWidget()],
      ),
      body: Obx(
        () => SmartRefreshWidget(
          refCtrl: controller.state.value.refCtrl,
          onRefresh: () => controller.onRefresh(),
          listenable: listenable,
          child: ListView(
            controller: controller.state.value.scrCtrl,
            children: [
              Stack(
                children: [
                  AuthHeader(
                    title:
                        "${Kstrings.allMsgs.tr} ${controller.state.value.allChats.length}",
                    supTitle: const SizedBox.shrink(),
                    padLef: 0,
                    padding: gPadding(right: 16, left: 16, bottom: 13),
                  ),
                  Positioned(
                    top: -6,
                    right: 0,
                    child: RefreshBody(listenable: listenable),
                  ),
                ],
              ),
              // 13.sH,
              _AllChatsBody(controller: controller),
              if (controller.state.value.rx.isLoadingMore) ...[Loader(size: 55)]
            ],
          ),
        ),
      ),
    );
  }
}

class _AllChatsBody extends StatelessWidget {
  const _AllChatsBody({required this.controller});

  final AllChatsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return HandlingRequstView(
      // RequestState.empty,
      controller.state.value.rx,
      image: Kimage.sms,
      title: Kstrings.emptyChats.tr,
      sub: Kstrings.emptyChatsSup.tr,
      padding: gPadding(top: 100),
      loading: _ListData(controller: controller),
      onTap: () => controller.getChats(),
      child: _ListData(controller: controller),
    );
  }
}

class _ListData extends StatelessWidget {
  const _ListData({required this.controller});

  final AllChatsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        // controller: controller.state.value.scrCtrl,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.state.value.rx.isLoading
            ? 16
            : controller.state.value.allChats.length,
        itemBuilder: (context, i) => AnimationListWidget(
          index: i,
          milliseconds: 350,
          // horizontal: 30,
          vertical: 30,
          child: controller.state.value.rx.isLoading
              ? const _LoadingBody()
              : ChatCard(model: controller.state.value.allChats[i]),
        ),
      ),
    );
  }
}

// ignore: unused_element
class _LoadingViewAllChats extends StatelessWidget {
  const _LoadingViewAllChats();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerWidget(
          child: Container(
            height: 5.4.h,
            width: 80.w,
            color: KColors.fillColor,
          ),
        ),
        13.sH,
        AnimationLimiter(
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            itemBuilder: (context, i) => const _LoadingBody(),
          ),
        ),
      ],
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: BeveledRectangleBorder(
        side: BorderSide(color: KColors.fillBorder, width: .3.w),
      ),
      leading: ShimmerWidget(
        child: Container(
          height: 56.h,
          width: 56.h,
          decoration: const BoxDecoration(
            color: KColors.fillColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShimmerWidget(
            child: Container(
              height: 5.4.h,
              width: 80.w,
              color: KColors.fillColor,
            ),
          ),
          ShimmerWidget(
            child: Container(
              height: 3.4.h,
              width: 40.w,
              color: KColors.fillColor,
            ),
          )
        ],
      ),
      subtitle: Padding(
        padding: gPadding(top: 10),
        child: ShimmerWidget(
          child: Container(
            height: 8.4.h,
            width: 100.w,
            color: KColors.fillColor,
          ),
        ),
      ),
    );
  }
}
