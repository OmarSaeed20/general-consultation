import '/index.dart';

class VideoPlayerNetWork extends StatefulWidget {
  const VideoPlayerNetWork({
    super.key,
    required this.uri,
    this.play = true,
    this.onTap,
  });
  final String? uri;
  final bool play;
  final Function()? onTap;
  @override
  State<VideoPlayerNetWork> createState() => _VideoPlayerNetWorkState();
}

class _VideoPlayerNetWorkState extends State<VideoPlayerNetWork> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  /*  late BetterPlayerController betterPlayerController;
 */
  @override
  void initState() {
    super.initState();
    /* betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        widget.uri!,
      ),
    ); */
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.uri!));

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
  }

  @override
  void dispose() {
    _controller.dispose();
    // betterPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      /*  Center(
        // Use the better player widget to display the video
        child: BetterPlayer(controller: betterPlayerController),
      ) */
      FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return TestVideoWidget2(controller: _controller, play: widget.play);
          } else {
            return const LoadingWidget(color: KColors.primaryDark);
          }
        },
      );
}

class TestVideoWidget2 extends StatelessWidget {
  const TestVideoWidget2(
      {super.key, required this.controller, this.play = true});

  final VideoPlayerController? controller;
  final bool play;
  @override
  Widget build(BuildContext context) => controller != null &&
          controller!.value.isInitialized
      ? Container(alignment: Alignment.center, child: _buildVideo())
      : controller == null
          ? Center(child: SizedBox(height: 50.h, child: const Icon(Icons.info)))
          : const LoadingWidget();

  Widget _buildVideo() => Stack(
        children: [
          play
              ? _buildVideoPlayer()
              : Positioned.fill(child: _buildVideoPlayer()),
          Positioned.fill(
            child: BasicOverLayWidget(controller: controller),
          )
        ],
      );
  Widget _buildVideoPlayer() => AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: VideoPlayer(controller!),
      );
}

class BasicOverLayWidget extends StatefulWidget {
  const BasicOverLayWidget({
    super.key,
    required this.controller,
    // this.play = true,
    // this.onTap,
  });
  final VideoPlayerController? controller;
  // final bool play;
  // final VoidCallback? onTap;

  @override
  State<BasicOverLayWidget> createState() => _BasicOverLayWidgetState();
}

class _BasicOverLayWidgetState extends State<BasicOverLayWidget> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() {
          widget.controller!.value.isPlaying
              ? widget.controller!.pause()
              : widget.controller!.play();
        }),
        child: Stack(
          children: <Widget>[
            buildPlay(),
            Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator()),
          ],
        ),
      );

  Widget buildIndicator() =>
      VideoProgressIndicator(widget.controller!, allowScrubbing: true);

  Widget buildPlay() => widget.controller!.value.isPlaying
      ? const SizedBox.shrink()
      : Center(
          child: Icon(Icons.play_arrow, color: KColors.white, size: 6.h),
        );
}
