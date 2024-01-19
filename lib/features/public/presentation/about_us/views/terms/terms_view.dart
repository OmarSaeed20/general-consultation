import 'package:general_consultation/index.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: BuildAppBar(title: Kstrings.termsAndConditions.tr),
          body: controller.rx.isLoading
              ? const LoadingWidget()
              : SingleChildScrollView(
                  padding: gPaddingAll(14),
                  // child: TextWidget(controller.aboutus?.appData.terms),
                  child: Html(
                    data: controller.aboutus?.appData.terms
                        .valide()
                        .replaceAll('& nbsp ؛', ''),
                    style: {
                      "h1": Style(
                        color: Colors.red,
                        fontFamily: "NotoSans",
                      ),
                      "p": Style(
                        fontSize: FontSize.medium,
                        color: KColors.greyDark,
                        padding: HtmlPaddings.only(),
                        fontFamily: "NotoSans",
                      ),
                      "ul": Style(
                        color: KColors.textGray,
                        // color: Colors.green.shade900,
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
                ),
        );
      },
    );
  }
}
