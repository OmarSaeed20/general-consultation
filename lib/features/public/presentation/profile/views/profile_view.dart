import '/core/widget/button/default_app_button.dart';

import '/index.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetX<ProfileControllerImp>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GButton(
                title: Kstrings.save.tr,
                margin: gPaddingAll(16),
                rx: controller.state.value.rx,
                onTap: () => controller.updateProfile(),
              ),
            ],
          ),
          appBar: BuildAppBar(title: Kstrings.accountS.tr),
          body: SingleChildScrollView(
            padding: gPaddingSymmetric(horizontal: 20),
            child: Column(
              children: [
                15.sH,
                Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          controller.state.value.selectedImage?.value != null
                              ? controller.deletePicture()
                              : controller.pickPicture(),
                      child: Container(
                        height: 120.h,
                        width: 120.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: .3.w,
                            color: KColors.fillBorder,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: 400.radius,
                          child: controller.state.value.selectedImage?.value !=
                                  null
                              ? Image.file(
                                  controller.state.value.selectedImage!.value!,
                                  fit: BoxFit.cover,
                                )
                              : ImageWidget(
                                  path: controller.state.value.userdata?.image,
                                  fit: BoxFit.cover,
                                  failerImg: Kimage.user,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.state.value.selectedImage?.value !=
                                  null
                              ? Colors.red.shade900
                              : KColors.primary,
                        ),
                        child: Icon(
                          controller.state.value.selectedImage?.value != null
                              ? Icons.cancel_rounded
                              : Icons.add,
                          color: KColors.white,
                        ),
                      ),
                    )
                  ],
                ),
                34.sH,
                TextInputWidget(
                  Kstrings.name.tr,
                  hintText: Kstrings.name.tr,
                  fillColor: KColors.transparent,
                  controller: controller.state.value.name,
                  prefixIcon: Kimage.profileIcon,
                ),
                24.sH,
                TextInputWidget(
                  Kstrings.mobileNumber.tr.capitalizeFirst,
                  // controller: controller.mobileCtrl,
                  prefixIcon: Row(
                    children: [
                      CountryCodePicker(
                        padding: EdgeInsets.zero,
                        onChanged: (value) => controller.onChangedPhone(
                          codeCountry: value.dialCode,
                        ),
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
                  controller: controller.state.value.phoneController,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => controller.onChangedPhone(phone: value),
                  fillColor: KColors.transparent,
                  validator: (value) =>
                      Utils.inputValidator('$value', type: Type.phone),
                ),
                /*  CountryCodePickerWidget(
                  phone: controller.state.value.phone,
                  isCorrectPhone: controller.state.value.isCorrectPhone,
                  initialValue: controller.state.value.phoneNumber,
                  fillColor: KColors.white,
                  onChanged: (phone) => controller.onChangedPhone(
                    value: '${phone.phoneNumber}',
                    codeCountry: '${phone.dialCode}',
                  ),
                  onValidated: (value) =>
                      controller.isCheckPhoneValidOrNot(value: value),
                ), */
                24.sH,
                TextInputWidget(
                  Kstrings.email.tr,
                  hintText: Kstrings.email.tr,
                  controller: controller.state.value.email,
                  fillColor: KColors.transparent,
                  prefixIcon: Kimage.sms,
                  readOnly: true,
                ),
                32.sH,
              ],
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
