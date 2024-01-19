import '/index.dart';

class ChooseLanguageView extends GetView<ChooseLanguageControllerImp> {
  const ChooseLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    /* return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          animating: true,
        ),
      ),
    ); */
    return Obx(
      // ignore: deprecated_member_use
      () => WillPopScope(
        onWillPop: () async {
          controller.changeLanguage();
          return await Future.value(true);
        },
        child: Scaffold(
          // SAVE LANG BUTTON
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BtnWidget(
                margin: gPadding(bottom: 40, right: 16, left: 16),
                rx: controller.state.value.rx,
                onTap: () {
                  print(controller.state.value.lang ==
                      controller.preferences.getLang);
                  if (controller.state.value.lang ==
                      controller.preferences.getLang) {
                    controller.noAction();
                  } else if (Get.previousRoute == Routes.main) {
                    controller.changeLanguage();
                  } else {
                    controller.selectLangFrist();
                  }
                },
                title: Kstrings.continueText.tr,
              ),
            ],
          ),
          appBar: AppBar(elevation: 0),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: gPadding(right: 16, left: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //LOGO
                  Image.asset(Kimage.logoPng, height: 83.h, fit: BoxFit.fill),
                  //WELCOME MESSAGE
                  TextWidget(
                    Kstrings.welcomeWithEmotion.tr,
                    style: gStyle20(fontWeight: FontWeight.w700),
                  ),
                  15.sH,
                  // WELCOME CHOOSE LANG MESSAGE
                  TextWidget(
                    Kstrings.chooseLanguage.tr,
                    textAlign: TextAlign.center,
                    style: gStyle16(color: KColors.textGray),
                  ),
                  32.sH,
                  _LanguageRadioBox(
                    index: 1,
                    isChosen: controller.state.value.lang == Keys.ar,
                    value: controller.state.value.lang,
                    groupValue: Keys.ar,
                    onChanged: (value) => controller.onSelectLang(lang: value!),
                    onTap: () => controller.onSelectLang(lang: Keys.ar),
                    text: Kstrings.arabic.tr,
                    image: Kimage.saIcon,
                  ),
                  _LanguageRadioBox(
                    value: controller.state.value.lang,
                    index: 2,
                    groupValue: Keys.en,
                    isChosen: controller.state.value.lang == Keys.en,
                    onChanged: (value) => controller.onSelectLang(lang: value!),
                    onTap: () => controller.onSelectLang(lang: Keys.en),
                    text: Kstrings.english.tr,
                    image: Kimage.ukIcon,
                  ),

                  _LanguageRadioBox(
                    index: 3,
                    text: Kstrings.ardo.tr,
                    image: Kimage.ardoIcon,
                    value: controller.state.value.lang,
                    groupValue: Keys.ardo,
                    onChanged: (value) =>
                        controller.onSelectLang(lang: Keys.ardo),
                    isChosen: controller.state.value.lang == Keys.ardo,
                    onTap: () => controller.onSelectLang(lang: Keys.ardo),
                  ),
                  16.sH,

                  _LanguageRadioBox(
                    index: 4,
                    text: Kstrings.hindi.tr,
                    image: Kimage.indiaIcon,
                    value: controller.state.value.lang,
                    groupValue: Keys.hindi,
                    onChanged: (value) =>
                        controller.onSelectLang(lang: Keys.hindi),
                    isChosen: controller.state.value.lang == Keys.hindi,
                    onTap: () => controller.onSelectLang(lang: Keys.hindi),
                  ),
                  16.sH,

                  _LanguageRadioBox(
                    index: 5,
                    text: Kstrings.flipino.tr,
                    image: Kimage.felipienIcon,
                    value: controller.state.value.lang,
                    groupValue: Keys.flipino,
                    onChanged: (value) =>
                        controller.onSelectLang(lang: Keys.flipino),
                    isChosen: controller.state.value.lang == Keys.flipino,
                    onTap: () => controller.onSelectLang(lang: Keys.flipino),
                  ),
                  16.sH,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageRadioBox extends StatelessWidget {
  const _LanguageRadioBox({
    required this.isChosen,
    required this.onChanged,
    required this.value,
    required this.groupValue,
    required this.text,
    required this.image,
    required this.onTap,
    required this.index,
  });
  final bool isChosen;
  final void Function(String?)? onChanged;
  final void Function() onTap;
  final String text, image, groupValue, value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: gPadding(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: 3.radius,
        border: Border.all(
          color: isChosen ? KColors.primary : KColors.greyLight,
          width: .5.w,
        ),
      ),
      child: AnimationListWidget(
        index: index,
        horizontal: 25,
        child: ListTile(
          contentPadding: gPadding(),
          splashColor: KColors.primary.withOpacity(.2),
          hoverColor: KColors.primary.withOpacity(.2),
          shape: const BeveledRectangleBorder(
              /*   borderRadius: 3.radius,
             side: BorderSide(
              color: isChosen ? KColors.primary : KColors.greyLight,
              width: .5.w,
            ), */
              ),
          title: TextWidget(
            text,
            textAlign: TextAlign.start,
            style: gStyle16(fontWeight: FontWeight.w500),
          ),
          onTap: onTap,
          trailing: Radio.adaptive(
            activeColor: KColors.primary,
            value: value,
            groupValue: groupValue,
            onChanged: (value) => onTap,
          ),
          leading: Padding(
            padding: gPaddingAll(16),
            child: SvgPicture.asset(image),
          ),
        ),
      ),
    );
  }
}
