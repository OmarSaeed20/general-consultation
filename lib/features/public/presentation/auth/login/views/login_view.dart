import '/index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: const _BottomNavigationBar(),
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: gPaddingSymmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(
                title: Kstrings.welcomeAgain.tr,
                supTitle: Kstrings.enterYourDataToContinue.tr,
              ),
              const _LoginBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: gPaddingSymmetric(vertical: 16),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                Kstrings.dontHaveAccount.tr,
                style: gStyle16(fontWeight: FontWeight.w700),
              ),
              5.sW,
              TextButton(
                onPressed: () => Get.toNamed(Routes.register),
                child: TextWidget(
                  Kstrings.createNewAccount.tr,
                  style: gStyle16(
                    color: KColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoginBody extends GetView<LoginControllerImp> {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.state.value.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // E-Mail Address Controller
            /* CountryCodePickerWidget(
              phone: controller.state.value.phone,
              isCorrectPhone: controller.state.value.isCorrectPhone,
              initialValue: controller.state.value.phoneNumber,
              onChanged: (phone) => controller.onChangedPhone(
                value: '${phone.phoneNumber}',
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
                    initialSelection: controller.state.value.codeCountry,
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
              onChanged: (phone) => controller.onChangedPhone(phone: phone),
              validator: (value) =>
                  Utils.inputValidator('$value', type: Type.phone),
            ),
            24.sH,
            // Pass Controller
            TextInputWidget(
              Kstrings.password.tr,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Kimage.lockIcon,
              suffixIcon: controller.state.value.suffixIcon,
              isPassword: controller.state.value.isPassword,
              onChanged: (value) =>
                  controller.onChangedPassword(value: '$value'),
              onPressed: () => controller.toggleObscure(),
              validator: (value) =>
                  Utils.inputValidator('$value', type: Type.password),
            ),
            16.sH,
            // Forget Password BUTTON
            Align(
              alignment: Alignment.centerLeft,
              child: TxtBtn(
                TextWidget(
                  Kstrings.forgotPassword.tr,
                  style: gStyle14(fontWeight: FontWeight.w700),
                ),
                onTap: () => Get.toNamed(Routes.forgotPassword),
              ),
            ),
            24.sH,
            BtnWidget(
              title: Kstrings.login.tr,
              rx: controller.state.value.rx,
              onTap: () => controller.login(),
            ),
            /*   ProgressButton(
              stateWidgets: {
                RequestState.none: TextWidget(Kstrings.login.tr),
                RequestState.loading: TextWidget(Kstrings.login.tr),
                RequestState.error: TextWidget(Kstrings.somethingWrong.tr),
                RequestState.success: const TextWidget("Login Success"),
              },
              stateColors: {
                RequestState.none: KColors.primaryDark,
                RequestState.loading: Colors.yellow.shade300,
                RequestState.error: KColors.redLight,
                RequestState.success: Colors.green.shade400,
              },
              onPressed: controller.login,
              state: controller.state.value.rx.value,
            ), */
            // const SochialSection(),
          ],
        ),
      ),
    );
  }
}

class SochialIcon extends StatelessWidget {
  const SochialIcon(this.img, {super.key, this.bColor, this.type});
  final String? img, type;
  final Color? bColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //debugPrint("type is >>> $type ");
        final Uri uri = Uri.parse(type.valide());

        if (await canLaunchUrl(uri)) {
          //debugPrint("2222222");
          launchUrl(uri);
        } else {
          toast("soon");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bColor,
          border: Border.all(
            color:
                bColor == null ? const Color(0xFF42413E) : KColors.transparent,
            width: .7.w,
          ),
          borderRadius: 10.radius,
        ),
        height: 40.h,
        width: 40.h,
        padding: gPaddingAll(0),
        margin: gPaddingSymmetric(horizontal: bColor == null ? 10 : 6),
        child: FittedBox(
          fit: img == Kimage.tiktokIcon ? BoxFit.cover : BoxFit.none,
          child: ImageWidget(height: 22.5, width: 22.5, path: img),
        ),
      ),
    );
  }
}

class SochialSection extends StatelessWidget {
  const SochialSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: gPadding(top: 40, bottom: 30),
          child: TextWidget(Kstrings.orlogin.tr, style: gStyle14()),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SochialIcon(Kimage.twitterIcon),
            SochialIcon(Kimage.googleIcon),
            SochialIcon(Kimage.facebookIcon),
          ],
        ),
      ],
    );
  }
}
