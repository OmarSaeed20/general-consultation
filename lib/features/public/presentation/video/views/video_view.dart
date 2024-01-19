import 'package:flutter/cupertino.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart' as blurhash;

import '/index.dart';

/* 
class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.path, required this.height});
  final String path;
  final double height;
  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.path.toString().replaceAll("http:", "https:")))
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    videoPlayerController.dispose();
    super.dispose();
  }

  List<String> videoExtensions = [
    'mp4',
    'mkv',
    'avi',
    'mov',
    'flv',
    'webm',
    "3g2",
    "3gp",
    "aaf",
    'asf',
    'm4v',
    'mpeg',
    'mpg',
    'ogv',
    'wmv',
    'gif',
    'avchd',
    'vob',
    'ogg',
    'qt',
    'mts',
  ];
  isVidu() {
    for (var extension in videoExtensions) {
      if (widget.path.toLowerCase().endsWith('.$extension')) return true;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) => Visibility(
        visible: isVidu(),
        child: Material(
          type: MaterialType.card,
          color: KColors.primary.withOpacity(.1),
          child: Container(
            margin: gPadding(top: 8),
            height: widget.height.h,
            width: context.width,
            // color: KColors.primary.withOpacity(.1),
            child: CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController,
            ),
          ),
        ),
      );

} 
 */
class VideoView extends StatelessWidget {
  const VideoView({
    super.key,
    required this.videoPlayerCtrl,
    this.onTap,
    this.removeTapped,
    this.isFile = false,
    this.isLoading = false,
    this.onTappedPlay,
  });
  final VideoPlayerController? videoPlayerCtrl;
  final VoidCallback? onTap;
  final VoidCallback? removeTapped;
  final bool? isFile;
  final bool isLoading;
  final VoidCallback? onTappedPlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: gPadding(bottom: 4, top: 8),
      child: ClipRRect(
        borderRadius: 8.radius,
        child: SizedBox(
          height: 165.h,
          width: context.width,
          child: (videoPlayerCtrl == null)
              ? _NullableVideoWidget(onTap: onTap)
              : (isLoading)
                  ? _NullableVideoWidget(onTap: onTap, isLoading: true)
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        CustomVideoPlayer(
                          customVideoPlayerController:
                              CustomVideoPlayerController(
                            context: context,
                            videoPlayerController: videoPlayerCtrl!,
                            customVideoPlayerSettings:
                                CustomVideoPlayerSettings(
                              playButton: GestureDetector(
                                onTap: onTappedPlay,
                                child: Icon(
                                  CupertinoIcons.play,
                                  color: KColors.primary,
                                  size: 22.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (isFile == true)
                          Positioned(
                            top: 8.h,
                            right: 8.w,
                            child: const CircleImageSvg(
                              path: Kimage.cancel,
                              color: KColors.white,
                              size: 40,
                              backgroundColor: KColors.redAccount,
                              isBorder: false,
                            ),
                          ),
                      ],
                    ),
        ),
      ),
    );
  }
}

class _NullableVideoWidget extends StatelessWidget {
  const _NullableVideoWidget({required this.onTap, this.isLoading = false});

  final VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const blurhash.BlurHash(hash: "LCF=Ha039v=^01~9D+NH?FR+e.R*"),
        if (isLoading) const LoadingWidget(),
        if (!isLoading)
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
              child: IconButton(
                style: IconButton.styleFrom(
                  shape: const CircleBorder(
                    side: BorderSide(color: KColors.white),
                  ),
                ),
                onPressed: onTap,
                icon: Icon(CupertinoIcons.play,
                    size: 25.h, color: KColors.primary),
              ),
            ),
          )
      ],
    );
  }
}
/* class VideoView extends StatelessWidget {
  const VideoView({
    super.key,
    required this.customVideoController,
    this.videoController,
    required this.onTap,
  });
  final CustomVideoPlayerController? customVideoController;
  final VideoPlayerController? videoController;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: 8.radius,
      child: videoController == null
          ? Stack(
              children: [
                // const BlurHash(hash: EndPoints.blurHash),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: IconButton.filled(
                      onPressed: onTap,
                      icon:
                          const Icon(CupertinoIcons.play, color: KColors.white),
                    ),
                  ),
                )
              ],
            )
          : CustomVideoPlayer(
              customVideoPlayerController: customVideoController!,
            ),
    );
  }
}
 */
/* class DisplayVideoWidget extends StatelessWidget {
  const DisplayVideoWidget({super.key, required this.url, required this.index});

  final String url;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideosControllers>(
      initState: (state) {
        if (state.controller != null) {
          state.controller?.listener(index);
        }
      },
      dispose: (state) async {
        if (state.controller != null) {
          //debugPrint(">>>>>>>>>>>>>>>>>>>>>>> state.controller != null ");
          state.controller?.videoControllers[index]?.pause();
        }
      },
      didChangeDependencies: (state) {
        if (state.controller != null) {
          //debugPrint(">>>>>>>>>>>>>>>>>>>>>>> didChangeDependencies ");
          // state.controller?.videoControllers[index]?.pause();
        }
      },
      didUpdateWidget: (oldWidget, state) {
        if (state.controller != null) {
          //debugPrint(">>>>>>>>>>>>>>>>>>>>>>> didUpdateWidget ");
        }
      },
      builder: (controller) {
        /* ever(controller.videoControllers as RxInterface<Object?>, (_) {
          //debugPrint(">>>>>>>>>>>>>>>>>>>>>>> state.controller != null ");

      for (var videoController in controller.videoControllers) {
        if (videoController?.value.isPlaying == true &&
            videoController != controller.videoControllers.last) {
          videoController?.pause();
        }
      }
    }); */
        // controller.initializeVideo(index, url);
        return Container(
          height: 165.h,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: 8.radius,
            child: (controller.videoControllers[index] == null)
                ? Stack(
                    children: [
                      // const BlurHash(hash: EndPoints.blurHash),
                      Material(
                        type: MaterialType.card,
                        color: KColors.primary.withOpacity(.1),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: IconButton(
                            style: IconButton.styleFrom(
                              shape: const CircleBorder(
                                side: BorderSide(color: KColors.white),
                              ),
                            ),
                            onPressed: () async =>
                                await controller.initializeVideo(index, url),
                            icon: Icon(
                              CupertinoIcons.play,
                              size: 25.h,
                              color: KColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : (controller.isLoading[index])
                    ? const LoadingWidget(color: KColors.primary)
                    : CustomVideoPlayer(
                        customVideoPlayerController:
                            controller.customVideoControllers[index]!,
                        /*  CustomVideoPlayerController(
                          context: Get.context!,
                          videoPlayerController:
                              controller.videoControllers[index]!,
                          customVideoPlayerSettings:
                              const CustomVideoPlayerSettings(
                            playButton: Icon(
                              CupertinoIcons.play,
                              color: KColors.primary,
                              size: 25,
                            ),
                          ),
                        ), */
                      ),
          ),
        );
      },
    );
  }
}
 */