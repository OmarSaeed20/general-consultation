import '/index.dart';
import 'widget/message_body.dart';

class ChatView extends GetView<ChatControllerImp> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: _buildAppBar(),
          body: Column(
            children: [
              Container(
                height: 1.5.h,
                width: double.infinity,
                color: KColors.fillBorder,
              ),
              if (controller.state.value.rx.isLoadingMore)
                const LoadingWidget(),
              Expanded(
                //? AnimationLimiter
                child: AnimationLimiter(
                  child: controller.state.value.chat == null
                      ? const LoadingWidget()
                      : ListView.builder(
                          itemCount: controller.state.value.messages.length,
                          reverse: true,
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          controller: controller.state.value.scrCtrl,
                          padding: gPadding(right: 15, left: 15),
                          itemBuilder: (context, index) {
                            final MessageEntity message =
                                controller.state.value.messages[index];
                            final bool isMe = message.userId ==
                                UserServiceImp.to.currentUser.value?.id;

                            return MessageBody(
                              message: message,
                              isMe: isMe,
                              index: index,
                            );
                          },
                        ),
                ),
              ),
              const CardTextFieldContent2(),
            ],
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: ListTile(
          contentPadding: gPadding(),
          dense: true,
          leading: CircleImageNetWork(
            url: controller.state.value.vendorImage,
            size: 35,
          ),
          title: TextWidget(
            controller.state.value.vendorName,
            style: gStyle16(fontWeight: FontWeight.w700),
          ),
        ),
      );
}
