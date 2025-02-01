import 'dart:io';

import 'package:flutter_blurhash/flutter_blurhash.dart';

import '/index.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.path,
    this.name,
    this.fit,
    this.height,
    this.width,
    this.color,
    this.onTap,
    this.message,
    this.padding,
    this.failerImg,
    this.onLongPress,
  });
  final dynamic path;
  final BoxFit? fit;
  final double? height, width;
  final Color? color;
  final VoidCallback? onTap, onLongPress;
  final String? failerImg, message, name;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var he = height?.h;
    var wi = width?.w;

    Widget getImage() {
      // //debugPrint("img type>>> ${path.runtimeType}");
      switch (path.runtimeType) {
        // ignore: type_literal_in_constant_pattern
        case Uint8List:
          return Image.memory(
            path,
            fit: fit,
            color: color,
            height: he,
            width: wi,
            semanticLabel: name,
          );
        case File:
          return Image.file(
            path,
            fit: fit,
            color: color,
            height: he,
            width: wi,
            semanticLabel: name,
          );
        default:
          if (path is String) {
            if (path.endsWith('.svg')) {
              return SvgPicture.asset(
                path,
                fit: fit ?? BoxFit.contain,
                height: he,
                semanticsLabel: name,
                width: wi,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
              );
            } else if (path.startsWith('http') ||
                path.startsWith('https') ||
                path.startsWith('www.')) {
              return CachedNetworkImage(
                imageUrl: path,
                fit: fit,
                width: wi,
                height: he,
                colorBlendMode: BlendMode.srcIn,
                errorWidget: (BuildContext context, _, stackTrace) {
                  return failerImg != null
                      ? Container(
                          height: 48.h,
                          width: 48.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: KColors.grey,
                          ),
                          child: ImageWidget(path: failerImg),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: KColors.fillBorder),
                          ),
                          child: const Icon(Icons.error),
                        );
                },
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const BlurHash(hash: "LCF=Ha039v=^01~9D+NH?FR+e.R*"),
                /* {
                  return Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: KColors.white,
                      valueColor: const AlwaysStoppedAnimation(KColors.primary),
                      value: downloadProgress.progress,
                    ),
                  );
                } */
              );
            }
          }
          return Image.asset(
            path,
            fit: fit,
            color: color,
            height: he,
            width: wi,
            semanticLabel: name,
          );
      }
    }

    return path != null
        ? TextButton(
            onPressed: onTap,
            onLongPress: onLongPress,
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(padding ?? gPadding()),
              shape: const WidgetStatePropertyAll(CircleBorder()),
            ),
            child: getImage(),
          )
        : Container(
            margin: gPaddingAll(25),
            height: he,
            width: wi,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: KColors.fillBorder),
            ),
            child: const Icon(Icons.error),
          );
  }
}

class CircleImageNetWork extends StatelessWidget {
  const CircleImageNetWork({
    super.key,
    required this.url,
    this.size = 40,
    this.bColor,
    this.borderColor = KColors.fillBorder,
  });
  final String? url;
  final double size;
  final Color? bColor, borderColor;
  @override
  Widget build(BuildContext context) => Container(
        height: size.h,
        width: size.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bColor,

          // image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(url)),
        ),
        child: ClipRRect(
          borderRadius: 400.radius,
          child: Visibility(
            visible: url != null,
            child: CachedNetworkImage(
              imageUrl: url!,
              width: size.h,
              height: size.h,
              fit: BoxFit.cover,
              errorWidget: (BuildContext context, _, stackTrace) => Center(
                child: Container(
                  padding: gPaddingAll(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: borderColor!),
                  ),
                  child: const Icon(Icons.error),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const BlurHash(hash: "LCF=Ha039v=^01~9D+NH?FR+e.R*"),
              /*  =>
                  Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: KColors.white,
                  valueColor: const AlwaysStoppedAnimation(KColors.primary),
                  value: downloadProgress.progress,
                ), 
              ),*/
            ),
          ),
        ),
      );
}

class CircleImageSvg extends StatelessWidget {
  const CircleImageSvg({
    super.key,
    required this.path,
    this.isLoading = false,
    this.size = 50,
    this.backgroundColor,
    this.isBorder = true,
    this.borderColor,
    this.color,
    this.callback,
  });
  final String? path;
  final bool isLoading, isBorder;
  final double size;
  final Color? backgroundColor, color, borderColor;
  final VoidCallback? callback;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: callback,
        child: Container(
          height: size.h,
          width: size.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: isBorder == true
                ? Border.all(color: borderColor ?? KColors.fillBorder)
                : null,
          ),
          child: Center(
            child: isLoading == true
                ? const LoadingWidget()
                : ClipRRect(
                    borderRadius: 200.radius,
                    child: Visibility(
                      visible: path != null,
                      child: SvgPicture.asset(
                        path!,
                        height: 22.5.h,
                        width: 22.5.h,
                        // ignore: deprecated_member_use
                        color: color,
                      ),
                    ),
                  ),
          ),
        ),
      );
}
