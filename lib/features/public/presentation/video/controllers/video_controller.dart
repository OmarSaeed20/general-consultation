import '/index.dart';

abstract class VideoController extends GetxController {
  // Future<void> initFileVideo({required File file});
  // Future<void> initNetworkVideo({required String url});
  Future<void> initVideoCtrls({required int index, required String url});
}

class VideoControllerImp extends VideoController {
  // VideoPlayerController? videoPlayerCtrl;

  /* @override
  Future<void> initFileVideo({required file}) async {
    videoPlayerCtrl = VideoPlayerController.file(file);
    await videoPlayerCtrl?.initialize();
    update();
  } */

  late List<VideoPlayerController?> videoPlayerAdsCtrls, videoPlayerMyAdsCtrls;
  late List<bool> isLoadingAds, isLoadingMyAds;

  @override
  Future<void> initVideoCtrls({required index, required url}) async {
    if (Get.currentRoute == Routes.myAllAds) {
      await _initVideo(videoPlayerMyAdsCtrls, isLoadingMyAds, index, url);
    } else {
      await _initVideo(videoPlayerAdsCtrls, isLoadingAds, index, url);
    }
  }

  Future<void> _initVideo(
    List<VideoPlayerController?> videoCtrls,
    List<bool> isLoad,
    int index,
    String url,
  ) async {
    if (videoCtrls[index] == null) {
      isLoad[index] = true;
      update();
      String secureUrl = url.replaceFirst("http://", "https://");
      videoCtrls[index] =
          VideoPlayerController.networkUrl(Uri.parse(secureUrl));
      await videoCtrls[index]?.initialize();
      isLoad[index] = false;
      update();
      for (int i = 0; i < videoCtrls.length; i++) {
        videoCtrls[i]?.pause();
        update();
      }
      if (index > 0) videoCtrls[index]?.play();

      update();
    }
  }

  void playinitializedVideo(int index) {
    List<VideoPlayerController?> videoCtrls =
        Get.currentRoute == Routes.myAllAds
            ? videoPlayerMyAdsCtrls
            : videoPlayerAdsCtrls;
    update();
    for (int i = 0; i < videoCtrls.length; i++) {
      if (i == index) {
        videoCtrls[i]?.play();
        update();
      } else {
        videoCtrls[i]?.pause();
        update();
      }
    }
  }

 /*  inserstData<T>(List<T>? list, int page) {
    debugPrint("list>>> is ${list?.length}");
    debugPrint("T>>> is $T");
    debugPrint("T is AdsEntity ${T is AdsEntity}");
    debugPrint("T is MyAdsEntity ${T is MyAdsEntity}");
/*  if (currentList.isEmpty || currentPage == 1) return responselist;
  currentList.addAll(responselist);
  return currentList; */
    if (T.toString().startsWith("AdsEntity")) {
      debugPrint("T>>> <<is>> AdsEntity");
       
        videoPlayerAdsCtrls = List.generate(list?.length ?? 0, (_) => null);
        isLoadingAds = List.generate(list?.length ?? 0, (_) => false);
       
    }
    if (T.toString().startsWith("MyAdsEntity")) {
      debugPrint("T>>> <<is>> MyAdsEntity");
      videoPlayerMyAdsCtrls = List.generate(list?.length ?? 0, (_) => null);
      isLoadingMyAds = List.generate(list?.length ?? 0, (_) => false);
    }
  } */

  void disposeVideoCtrl() {
    List<VideoPlayerController?> videoCtrls =
        Get.currentRoute == Routes.myAllAds
            ? videoPlayerMyAdsCtrls
            : videoPlayerAdsCtrls;
    for (int i = 0; i < videoCtrls.length; i++) {
      if (videoCtrls[i]?.value.isInitialized == true) {
        videoCtrls[i]?.dispose();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    disposeVideoCtrl();
  }
}

/* 
abstract class VideoController extends GetxController {
  void initializeVideo(int index, String url);
}

class VideosControllers extends VideoController {
  late List<VideoPlayerController?> videoControllers = [];
  late List<CustomVideoPlayerController?> customVideoControllers = [];
  late List<bool> isLoading;

  @override
  Future<void> initializeVideo(int index, String url) async {
    if (videoControllers[index] == null && Utils.isValiedVideo(url)) {
      isLoading[index] = true;
      update();
      String secureUrl = url.replaceFirst("http://", "https://");
      videoControllers[index] =
          VideoPlayerController.networkUrl(Uri.parse(secureUrl));
      await videoControllers[index]?.initialize();
      isLoading[index] = false;
      update();
      /* .then((value) => update()) */
      customVideoControllers[index] = CustomVideoPlayerController(
        context: Get.context!,
        videoPlayerController: videoControllers[index]!,
        customVideoPlayerSettings: const CustomVideoPlayerSettings(
          playButton:
              Icon(CupertinoIcons.play, color: KColors.primary, size: 25),
        ),
      );

/*       //debugPrint(
          ">>>>>>>>>>>>>>>>>>>>>>> element is ${videoControllers[index]}");
      for (var element in videoControllers) {
        if (element != null) {
          //debugPrint(
              ">>>>>>>>>>>>>>>>>>>>>>> element is ${element.value.isInitialized}");
          //debugPrint(
              ">>>>>>>>>>>>>>>>>>>>>>> isPlaying is ${element.value.isPlaying}");
          if (element.value.isPlaying) element.pause();
        }
      } */

      update();
      if (index > 0) videoControllers[index]?.play();
      update();
    }
  }

  Future<void> onVideoTap({required int index, required String url}) async =>
      await initializeVideo(index, url);
  listener(int index) {
    for (int i = 0; i < videoControllers.length; i++) {
      if (i == index) {
        videoControllers[i]?.play();
      } else {
        videoControllers[i]?.pause();
      }
    }
  }

  /* _addListenerVideo() {
    //debugPrint(">>>>>>>>>>>>>>>>>>>>>> _addListenerVideo");
    for (var element in videoControllers) {
      element?.addListener(_listener);
    }
  } */

  @override
  void onInit() {
    // _addListenerVideo();
    super.onInit();
  }

  @override
  void dispose() {
    // if (videoPlayerCtrl.value.isInitialized) videoPlayerCtrl.dispose();

    for (int i = 0; i < videoControllers.length; i++) {
      videoControllers[i]?.dispose();
    }
    super.dispose();
  }

  @override
  void onClose() {
    // if (videoPlayerCtrl.value.isInitialized) videoPlayerCtrl.dispose();
    for (int i = 0; i < videoControllers.length; i++) {
      videoControllers[i]?.dispose();
    }

    super.onClose();
  }
}
 */