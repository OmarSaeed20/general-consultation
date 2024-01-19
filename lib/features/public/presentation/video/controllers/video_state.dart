/* import 'dart:io';
import '/index.dart';

class VideoState extends Equatable {
  const VideoState({
    this.videoController,
    this.customVideoController,
  });
  final VideoPlayerController? videoController;
  final CustomVideoPlayerController? customVideoController;

  VideoState copyWith({
    VideoPlayerController? videoController,
    CustomVideoPlayerController? customVideoController,
    File? video,
  }) =>
      VideoState(
        videoController: videoController ?? this.videoController,
        customVideoController:
            customVideoController ?? this.customVideoController,
      );

  @override
  List<Object?> get props => [
        videoController,
        customVideoController,
      ];
}
 */