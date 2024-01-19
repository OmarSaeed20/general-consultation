import '/index.dart';

import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsControllerImp> {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BtnWidget(
              margin: gPaddingAll(16),
              title: Kstrings.send.tr,
              rx: controller.state.value.rx,
              onTap: () => controller.sendContactUs(),
            ),
          ],
        ),
        appBar: BuildAppBar(title: Kstrings.contactUs.tr),
        body: Form(
          key: controller.state.value.form,
          child: ListView(
            padding: gPadding(top: 30, right: 16, left: 16),
            children: [
              AuthHeader(
                title: Kstrings.contactUsSup.tr,
                supTitle: const SizedBox.shrink(),
                padding: gPadding(left: 96, bottom: 34),
              ),
              Container(
                height: .5.h,
                width: 300.w,
                alignment: Alignment.center,
                margin: gPaddingSymmetric(vertical: 24),
                color: KColors.grey,
              ),
              /*  TextInputWidget(
                  Kstrings.email.tr,
                  onChanged: (email) => controller.onChangedEmail(email!),
                  hintText: Kstrings.emailHint.tr,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Kimage.smsIcon,
                  fillColor: KColors.transparent,
                  validator: (value) => Utils.inputValidator(value!, Type.email),
                ),
                16.sH, */
              TextInputWidget(
                Kstrings.message.tr,
                validator: (value) => Utils.inputValidator("$value"),
                // onChanged: (content) => controller.onChangedContent(content!),
                hintText: Kstrings.writeHere.tr,
                controller: controller.state.value.content.value,
                keyboardType: TextInputType.text,
                fillColor: KColors.transparent,
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
