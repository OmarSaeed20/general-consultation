import '/index.dart';

class ChangePassView extends GetView<ChangePassControllerImp> {
  const ChangePassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BtnWidget(
                margin: gPaddingAll(16),
                title: Kstrings.save.tr,
                rx: controller.state.value.rx,
                onTap: () => controller.changePassword(),
              ),
            ],
          ),
          appBar: BuildAppBar(title: Kstrings.changePassword.tr),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: gPaddingAll(20),
              child: Form(
                key: controller.state.value.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    34.sH,
                    TextInputWidget(
                      Kstrings.oldPassword.tr,
                      controller: controller.state.value.oldPass.value,
                      isPassword: controller.state.value.isOldPassword,
                      suffixIcon: controller.state.value.suffixIconOld,
                      onPressed: () => controller.toggleObscureOld(),
                      prefixIcon: Kimage.lock2,
                    ),
                    24.sH,
                    TextInputWidget(
                      Kstrings.newPassword.tr,
                      hintText: Kstrings.password.tr,
                      controller: controller.state.value.password.value,
                      isPassword: controller.state.value.isPassword,
                      suffixIcon: controller.state.value.suffixIcon,
                      onPressed: () => controller.toggleObscure(),
                      prefixIcon: Kimage.lock2,
                      validator: (value) =>
                          Utils.inputValidator('$value', type: Type.password),
                    ),
                    24.sH,
                    TextInputWidget(
                      Kstrings.confairmANewPassword.tr,
                      hintText: Kstrings.password.tr,
                      controller: controller.state.value.passwordConfirm.value,
                      isPassword: controller.state.value.isPasswordConfirm,
                      suffixIcon: controller.state.value.suffixIconConfirm,
                      onPressed: () => controller.toggleObscureConfirm(),
                      prefixIcon: Kimage.lock2,
                      validator: (value) => Utils.inputValidator(
                        '$value',
                        type: Type.passwordConfirm,
                        val: controller.state.value.password.value.text,
                      ),
                      /*  validator: (value) {
                        if (value!.trim().isEmpty || value.isEmpty) {
                          return "incorrectPasswordLogin".tr;
                        } else if (value !=
                            controller.state.value.password.value.text) {
                          return Kstrings.errorInConfairmPassword.tr;
                        }

                        return null;
                      }, */
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/* class MoreTile extends StatelessWidget {
  const MoreTile({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                borderRadius: 32.radius,
                color: KColor.primary.withOpacity(0.08)),
            child: Image.asset(icon)),
        title: TextWidget(
          title,
          style: gStyle16(),
        ),
        trailing: const Icon(Icons.arrow_forward_ios));
  }
} */
