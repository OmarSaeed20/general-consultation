import 'package:flutter_html/flutter_html.dart';

import '/index.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: BuildAppBar(title: Kstrings.aboutApp.tr),
          body: controller.rx.isLoading
              ? const LoadingWidget()
              : ListView(
                  padding: gPadding(top: 30, right: 14, left: 14),
                  children: [
                    const ImageWidget(path: Kimage.logoPng, height: 165),
                    Html(
                      data: controller.aboutus?.appData.terms
                          .valide()
                          .replaceAll('& nbsp ؛', ''),
                      style: {
                        "h1": Style(color: Colors.red, fontFamily: "NotoSans"),
                        "p": Style(
                          fontSize: FontSize.medium,
                          color: KColors.greyDark,
                          padding: HtmlPaddings.only(),
                          textAlign: TextAlign.start,
                          fontFamily: "NotoSans",
                        ),
                        "ul": Style(
                          color: KColors.textGray,
                          fontFamily: "NotoSans",
                        ),
                      },
                      onLinkTap: (url, attributes, element) async {
                        final Uri uri = Uri.parse(url ?? '');
                        if (await canLaunchUrl(uri)) {
                          launchUrl(uri);
                        }
                      },
                    ),
                    /* TextWidget(
                      controller.aboutus?.appData.aboutUs,
                      style: gStyle12(),
                      textAlign: TextAlign.center,
                    ), */
                    45.sH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SochialIcon(
                          Kimage.twitterIcon,
                          bColor: const Color(0xFF03A9F4).withOpacity(0.1),
                          type: controller.aboutus?.socialMedia?.twitter,
                        ),
                        SochialIcon(
                          Kimage.tiktokIcon,
                          bColor: const Color(0xFF10162E).withOpacity(0.1),
                          type: controller.aboutus?.socialMedia?.tiktok,
                        ),
                        SochialIcon(
                          Kimage.youtube2,
                          bColor: const Color(0xFFFF4040).withOpacity(0.1),
                          type: controller.aboutus?.socialMedia?.youtube,
                        ),
                        SochialIcon(
                          Kimage.instagramIcon,
                          bColor: const Color(0xFFFA9905).withOpacity(0.1),
                          type: controller.aboutus?.socialMedia?.instagram,
                        ),
                        SochialIcon(
                          Kimage.facebookIcon,
                          bColor: const Color(0xFF1877F2).withOpacity(0.1),
                          type: controller.aboutus?.socialMedia?.facebook,
                        ),
                      ],
                    ),
                    Container(
                      height: .5.h,
                      width: 300.w,
                      alignment: Alignment.center,
                      margin: gPaddingSymmetric(vertical: 24),
                      color: KColors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TxtBtn(
                          TextWidget(
                            Kstrings.privacyPolicy.tr,
                            style: gStyle12(),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            Get.toNamed(Routes.privacy);
                            /* DialogManager.showAcceptDialog(
                              controller.aboutus!.appData.policy.valide(),
                              context: context,
                              onAccept: () {},
                            ); */
                          },
                        ),
                        Container(
                          height: 6.h,
                          width: 6.h,
                          margin: gPaddingSymmetric(horizontal: 8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: KColors.grey,
                          ),
                        ),
                        TxtBtn(
                          onTap: () {
                            Get.toNamed(Routes.terms);
                            /* 
                            DialogManager.showAcceptDialog(
                              controller.aboutus!.appData.terms.valide(),
                              context: context,
                              onAccept: () {},
                            ); */
                          },
                          TextWidget(
                            Kstrings.termsAndConditions.tr,
                            style: gStyle12(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
        );
      },
    );
  }
}
