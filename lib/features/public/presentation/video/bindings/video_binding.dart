import '/index.dart';

class VideoBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut<VideoControllerImp>(() => VideoControllerImp(), fenix: true);
}
