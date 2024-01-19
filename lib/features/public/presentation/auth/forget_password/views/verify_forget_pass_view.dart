import '../../../../../../core/widget/app_text_field/pin_code_text_field_widget.dart';
import '../../../../../../core/widget/app_text_field/resend_otp_code_widget.dart';

import '/index.dart';

class VerifyForgetPassView extends GetView<VerifyEmailControllerImp> {
  const VerifyForgetPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: gPaddingSymmetric(horizontal: 16),
            child: Form(
              key: controller.state.value.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(
                    title: Kstrings.verifyTitle.tr,
                    supTitle: Kstrings.verifyTitleSup.tr,
                    padLef: 56,
                    padding: gPadding(top: 30),
                  ),
                  TextWidget(
                    controller.state.value.email,
                    style: gStyle14(color: KColors.primary),
                    padding: gPadding(bottom: 30, top: 5),
                  ),
                  PinCodeTextFieldWidget(
                    lenght: 6,
                    onChanged: (value) =>
                        controller.onChangedCode(value: value),
                    errorAnimationController:
                        controller.state.value.errorAnimationType!,
                  ),
                  BtnWidget(
                    title: Kstrings.send.tr,
                    margin: gPadding(top: 24, bottom: 45),
                    rx: controller.state.value.rx,
                    onTap: () => controller.verifyEmail(),
                  ),
                  ResendOtpCodeWidget(
                    isLoading: controller.state.value.rxResendCode.isLoading,
                    onPressed: controller.state.value.timeCounter != 0
                        ? null
                        : () => controller.resendCode(),
                    timer: controller.state.value.timeCounter == 0
                        ? Kstrings.resendCode.tr
                        : '00:${controller.state.value.timeCounter.toString().padLeft(2, '0')}',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
