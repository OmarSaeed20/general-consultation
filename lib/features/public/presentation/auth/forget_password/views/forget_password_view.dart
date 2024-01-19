
import '/index.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: gPaddingSymmetric(vertical: 44),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  Kstrings.rememberYourPassword.tr,
                  style: gStyle16(fontWeight: FontWeight.w700),
                ),
                5.sW,
                TxtBtn(
                  TextWidget(
                    Kstrings.login.tr,
                    style: gStyle16(
                      color: KColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: gPaddingSymmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(
                title: Kstrings.forgetYourPassword.tr,
                supTitle: Kstrings.forgetYourPasswordSup.tr,
                padLef: 55,
              ),
              const _ForgetPasswordBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForgetPasswordBody extends GetView<PhoneForgetControllerImp> {
  const _ForgetPasswordBody();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.state.value.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // E-Mail Address Controller
            TextInputWidget(
              Kstrings.email.tr,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Kimage.smsIcon,
              onChanged: (value) => controller.onChangedEmail(value: '$value'),
              validator: (value) =>
                  Utils.inputValidator('$value', type: Type.email),
            ),
            24.sH,

            BtnWidget(
              title: Kstrings.send.tr,
              margin: gPadding(top: 24, bottom: 45),
              rx: controller.state.value.rx,
              onTap: () => controller.setEmailAddress(),
            ),
          ],
        ),
      ),
    );
  }
}
