
import '/index.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: gPaddingSymmetric(horizontal: 15),
          children: [
            AuthHeader(
              title: Kstrings.registerTitle.tr,
              supTitle: Kstrings.registerSup.tr,
            ),
            const _RegisterBody(),
          ],
        ),
      ),
    );
  }
}

class _RegisterBody extends GetView<RegisterControllerImp> {
  const _RegisterBody();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.state.value.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextInputWidget(
              Kstrings.name.tr,
              hintText: Kstrings.enterName.tr,
              keyboardType: TextInputType.name,
              prefixIcon: Kimage.profileIcon,
              onChanged: (value) =>
                  controller.onChangedUsername(value: '$value'),
              validator: (value) =>
                  Utils.inputValidator('$value', type: Type.username),
            ),
            25.sH,
            /* CountryCodePickerWidget(
              phone: controller.state.value.phone,
              isCorrectPhone: controller.state.value.isCorrectPhone,
              initialValue: controller.state.value.phoneNumber,
              onChanged: (phone) => controller.onChangedPhone(
                phone: '${phone.phoneNumber}',
                codeCountry: '${phone.dialCode}',
              ),
              onValidated: (value) =>
                  controller.isCheckPhoneValidOrNot(value: value),
            ), */
            TextInputWidget(
              Kstrings.mobileNumber.tr.capitalizeFirst!,
              // controller: controller.mobileCtrl,
              prefixIcon: Row(
                children: [
                  CountryCodePicker(
                    padding: EdgeInsets.zero,
                    onChanged: (value) =>
                        controller.onChangedPhone(codeCountry: value.dialCode),
                    initialSelection: '+965',
                    favorite: const ['+965', "+20"],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  Container(
                    width: 1.w,
                    padding: gPaddingSymmetric(vertical: 16),
                    height: 40.h,
                    color: KColors.greyDark,
                  ),
                ],
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) => controller.onChangedPhone(phone: value),
              validator: (value) =>
                  Utils.inputValidator('$value', type: Type.phone),
            ),
            25.sH,
            TextInputWidget(
              Kstrings.email.tr,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Kimage.smsIcon,
              onChanged: (value) => controller.onChangedEmail(value: '$value'),
              validator: (value) =>
                  Utils.inputValidator('$value', type: Type.email),
            ),
            25.sH,
            TextInputWidget(
              Kstrings.password.tr,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Kimage.lockIcon,
              suffixIcon: controller.state.value.suffixIcon,
              isPassword: controller.state.value.isPassword,
              onPressed: () => controller.toggleObscure(),
              onChanged: (value) =>
                  controller.onChangedPassword(value: '$value'),
              validator: (value) =>
                  Utils.inputValidator('$value', type: Type.password),
            ),
            25.sH,
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
                type: Type.passwordConfirm,
                val: controller.state.value.password,
              ),
            ),
            25.sH,
            BtnWidget(
              title: Kstrings.signUp.tr,
              rx: controller.state.value.rx,
              onTap: () => controller.register(),
            ),
            Padding(
              padding: gPadding(left: 10, right: 10, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    Kstrings.haveAccAlready.tr,
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
      ),
    );
  }
}
