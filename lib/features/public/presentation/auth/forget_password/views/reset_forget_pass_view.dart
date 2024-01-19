
import '/index.dart';

class ResetForgetPassView extends GetView<ResetPasswordControllerImp> {
  const ResetForgetPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: gPaddingSymmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: controller.state.value.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeader(
                  title: Kstrings.createANewPassword.tr,
                  supTitle: Kstrings.createANewPasswordSup.tr,
                  padLef: 55,
                ),
                32.sH,
                TextInputWidget(
                  Kstrings.newPassword.tr,
                  hintText: Kstrings.password.tr,
                  prefixIcon: Kimage.lockIcon,
                  isPassword: controller.state.value.isPassword,
                  suffixIcon: controller.state.value.suffixIcon,
                  onChanged: (value) =>
                      controller.onChangedPassword(value: '$value'),
                  onPressed: () => controller.toggleObscure(),
                  validator: (value) =>
                      Utils.inputValidator('$value',type: Type.password),
                ),
                24.sH,
                TextInputWidget(
                  Kstrings.confairmANewPassword.tr,
                  hintText: Kstrings.password.tr,
                  prefixIcon: Kimage.lockIcon,
                  isPassword: controller.state.value.isPasswordConfirm,
                  suffixIcon: controller.state.value.suffixIconConfirm,
                  onChanged: (value) =>
                      controller.onChangedPasswordConfirm(value: '$value'),
                  onPressed: () => controller.toggleObscureConfirm(),
                  validator: (value) => Utils.inputValidator(
                    '$value',
                    type:Type.passwordConfirm,
                    val: controller.state.value.password,
                  ),
                ),
                BtnWidget(
                  title: Kstrings.confirm.tr,
                  margin: gPadding(top: 24, bottom: 45),
                  rx: controller.state.value.rx,
                  onTap: () => controller.resetPassword(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
