import 'package:flutter/cupertino.dart';
import '/index.dart';
// import 'package:lottie/lottie.dart';

class CustomBageStateWidget extends StatelessWidget {
  const CustomBageStateWidget({
    super.key,
    this.image,
    required this.title,
    required this.supTitle,
    required this.rx,
    this.lottie,
    this.imageSize = const Size(125, 125),
    this.onTap,
    // this.isImage = true,
    this.fitImg,
    this.fitLot,
    this.isLoading = false,
    this.imageColor = KColors.textGray3,
  });
  final String? image, lottie;
  final Size imageSize;
  final String title, supTitle;
  final BoxFit? fitImg, fitLot;
  final Color? imageColor;
  final bool isLoading;
  final RequestState rx;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _imageWidget(),
        TextWidget(
          title,
          style: gStyle16(),
          padding: gPadding(top: 15),
        ),
        TextWidget(
          supTitle,
          textAlign: TextAlign.center,
          style: gStyle14(color: KColors.textGray3),
          padding: gPadding(
              bottom: 25, right: context.width / 6, left: context.width / 6),
        ),
        Visibility(
          visible: onTap != null,
          child: BtnWidget(
            title: Kstrings.reload.tr,
            titleColor: KColors.textPrimaryColor,
            border: Border.all(width: .3, color: KColors.black),
            backgroundColor: KColors.white,
            // title: Kstrings.retry.tr,
            rx: rx,
            onTap: onTap,
          ),
        ),
      ],
    );
  }

  Container _imageWidget() {
    return Container(
      // margin: gPadding(top: 150),
      alignment: Alignment.center,
      child: rx.isOffLine || rx.isError
          ? Icon(
              switch (rx) {
                RequestState.offLineFailure =>
                  CupertinoIcons.wifi_exclamationmark,
                _ => CupertinoIcons.exclamationmark_triangle,
              },
              size: imageSize.height.h,
              color: imageColor,
            )
          : !image.isEmptyOrNul
              ? ImageWidget(
                  path: image,
                  fit: fitImg ?? BoxFit.contain,
                  height: imageSize.height,
                  width: imageSize.width,
                  color: imageColor,
                )
              : rx.isEmpty
                  ? Icon(
                      CupertinoIcons.doc_text_search,
                      size: imageSize.height.h,
                      color: imageColor,
                    )
                  : const SizedBox.shrink(),
    );
  }
}
