import 'package:flutter_html/flutter_html.dart';
import 'package:general_consultation/index.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: BuildAppBar(title: Kstrings.privacyPolicy.tr),
          body: controller.rx.isLoading
              ? const LoadingWidget()
              : SingleChildScrollView(
                  padding: gPaddingAll(14),
                  // child: TextWidget(controller.aboutus?.appData.policy),
                  child: Html(
                    data: controller.aboutus?.appData.policy
                        .valide()
                        .replaceAll('& nbsp ؛', ''),
                    style: {
                      "h1": Style(color: Colors.red),
                      "p": Style(
                        fontSize: FontSize.medium,
                        color: KColors.greyDark,
                        padding: HtmlPaddings.only(),
                      ),
                      "ul": Style(color: Colors.green.shade900),
                    },
                    onLinkTap: (url, attributes, element) async {
                      final Uri uri = Uri.parse(url ?? '');
                      if (await canLaunchUrl(uri)) {
                        launchUrl(uri);
                      }
                    },
                  ),
                ),
        );
      },
    );
  }
}
