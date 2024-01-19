import 'dart:math';

import 'package:general_consultation/index.dart';
import 'package:photo_view/photo_view.dart'; 

class ChatImageBody extends StatelessWidget {
  const ChatImageBody({
    super.key,
    required this.url,
    this.margin,
    this.isChat = false,
    this.height,
  });
  final String url;
  final EdgeInsetsGeometry? margin;
  final bool isChat;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "someTag $url ${Random().nextInt(999)}",
      child: Container(
        margin: margin,
        decoration: BoxDecoration(borderRadius: 8.radius),
        constraints: BoxConstraints(
          maxHeight: (height ?? (context.height / 3)).h,
          maxWidth: isChat ? context.width * .7 : double.infinity,
        ),
        child: ClipRRect(
          borderRadius: 8.radius,
          child: GestureDetector(
            onTap: () => Get.bottomSheet(
              SafeArea(
                child: SizedBox(
                  height: ScreenUtil().screenHeight /*  - 50.h */,
                  width: ScreenUtil().screenWidth,
                  child: HeroPhotoViewRouteWrapper(
                    imageProvider: NetworkImage(url),
                  ),
                ),
              ),
              elevation: 0.0,
              isScrollControlled: true,
              backgroundColor: KColors.black,
              shape: RoundedRectangleBorder(borderRadius: 0.radius),
            ),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInSine,
              child: isChat
                  ? Image.network(
                      url,
                      fit: BoxFit.cover,
                      /* loadingBuilder: (context, child, loadingProgress) =>
                          BlurHash(
                        hash: "LCF=Ha039v=^01~9D+NH?FR+e.R*",
                        image: url,
                      ), */
                      // width: isChat ? context.width * .7 : double.infinity,
                    )
                  : CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      // colorBlendMode: BlendMode.srcIn,
                      errorWidget: (BuildContext context, _, stackTrace) =>
                          DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: KColors.fillBorder),
                        ),
                        child: const Icon(Icons.error),
                      ),
                      /*  progressIndicatorBuilder: (context, url, downloadProgress) =>
                    BlurHash(
                  hash: "LCF=Ha039v=^01~9D+NH?FR+e.R*",
                  image: url,
                ), */
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatImageDraftBody extends StatelessWidget {
  const ChatImageDraftBody({super.key, required this.file});
  final String file;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HeroPhotoViewRouteWrapper(
              imageProvider: NetworkImage(file),
            ),
          ),
        ),
        child: Hero(
          tag: "someTag",
          child: Image.network(
            file,
            width: context.width * .7,
            loadingBuilder: (_, child, chunk) =>
                chunk != null ? const LoadingWidget() : child,
          ),
        ),
      ),
    );
  }
}

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  const HeroPhotoViewRouteWrapper({
    super.key,
    required this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      padding: gPadding(bottom: 20),
      child: PhotoView(
        imageProvider: imageProvider,
        backgroundDecoration: backgroundDecoration,
        minScale: minScale,
        maxScale: maxScale,
        heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
      ),
    );
  }
}

class ExampleAppBar extends StatelessWidget {
  const ExampleAppBar(
      {super.key, required this.title, this.showGoBack = false});

  final String title;
  final bool showGoBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12, spreadRadius: 10.0, blurRadius: 20.0)
            ]),
        child: Row(
          children: <Widget>[
            Container(
              child: showGoBack
                  ? IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                    )
                  : Container(
                      height: 50.0,
                    ),
            ),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExampleAppBarLayout extends StatelessWidget {
  const ExampleAppBarLayout({
    Key? key,
    required this.title,
    this.showGoBack = false,
    required this.child,
  }) : super(key: key);

  final String title;
  final bool showGoBack;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ExampleAppBar(
              title: title,
              showGoBack: showGoBack,
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
