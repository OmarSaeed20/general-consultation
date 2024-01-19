import '../../../../../../core/widget/app_text_field/pin_code_text_field_widget.dart';
import '../../../../../../core/widget/app_text_field/resend_otp_code_widget.dart';

import '/index.dart';

class VerifyCodeView extends GetView<VerifyCodeControllerImp> {
  const VerifyCodeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Form(
            key: controller.state.value.formKey,
            child: ListView(
              padding: gPaddingSymmetric(horizontal: 15),
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: IconBackWidget(),
                ),
                AuthHeader(
                  title: Kstrings.verifyTitle.tr,
                  supTitle: Kstrings.verifyTitleSup.tr,
                  padLef: 55,
                ),
                TextWidget(
                  controller.state.value.phone,
                  style: gStyle14(color: KColors.primary),
                  padding: gPadding(bottom: 30, top: 5),
                ),
                PinCodeTextFieldWidget(
                  lenght: 6,
                  onChanged: (value) => controller.onChangedCode(value: value),
                  errorAnimationController:
                      controller.state.value.errorAnimationType!,
                ),
                BtnWidget(
                  title: Kstrings.send.tr,
                  margin: gPadding(top: 25, bottom: 45),
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
    );
  }
}

// ignore: unused_element
class _ResendOtpCodeContent extends StatelessWidget {
  const _ResendOtpCodeContent({required this.controller});

  final VerifyCodeControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            Kstrings.havenotReceivedOtp.tr,
            textAlign: TextAlign.center,
            style: gStyle16(fontWeight: FontWeight.w500),
          ),
          controller.state.value.rxResendCode.isLoading
              ? const LoadingWidget(color: KColors.primary)
              : TextButton(
                  onPressed: controller.state.value.timeCounter != 0
                      ? null
                      : () => controller.resendCode(),
                  child: TextWidget(
                    '${Kstrings.resendCode.tr}${controller.state.value.timeCounter}' ==
                            '0'
                        ? ' '
                        : '(00:${controller.state.value.timeCounter.toString().padLeft(2, '0')})',
                    textAlign: TextAlign.center,
                    style: gStyle16(
                      color: KColors.primary,
                      decoration: controller.state.value.timeCounter == 0
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
