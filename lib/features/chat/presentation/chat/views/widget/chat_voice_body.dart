part of 'message_body.dart';

class ChatVoiceBody extends StatefulWidget {
  const ChatVoiceBody({
    super.key,
    required this.audioSrc,
    required this.isMe,
    this.isFile = false,
    required this.dateTime,
  });
  final String? audioSrc, dateTime;
  final bool isFile, isMe;

  @override
  State<ChatVoiceBody> createState() => _ChatVoiceBodyState();
}

class _ChatVoiceBodyState extends State<ChatVoiceBody> {
  @override
  void dispose() async {
    super.dispose();
    await _VoiceManager().dispose(widget.audioSrc.valide());
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      alignment: widget.isMe
          ? AlignmentDirectional.topStart
          : AlignmentDirectional.topEnd,
      child: Stack(
        children: [
          VoiceMessageView(
            backgroundColor: widget.isFile
                ? KColors.black
                : widget.isMe
                    ? KColors.primary
                    : KColors.fillColor,
            circlesColor: widget.isFile
                ? KColors.white
                : widget.isMe
                    ? KColors.white
                    : KColors.black,
            notActiveSliderColor: widget.isFile
                ? KColors.primary.withOpacity(.3)
                : widget.isMe
                    ? KColors.primary.withOpacity(0.4)
                    : KColors.fillColor.withOpacity(0.4),
            activeSliderColor: widget.isFile
                ? KColors.primary
                : widget.isMe
                    ? KColors.white
                    : KColors.black,
            counterTextStyle: gStyle12(
              color: widget.isMe ? KColors.white : KColors.black,
              fontWeight: FontWeight.w500,
            ),
            circlesTextStyle: gStyle10(
              color: widget.isMe ? KColors.white : KColors.black,
              fontWeight: FontWeight.w800,
            ),
            controller: _VoiceManager()
                .voiceCtrl(widget.audioSrc.valide(), widget.isFile),
            innerPadding: 2.h,
            cornerRadius: 6.r,
          ),
          // if (!widget.isFile)
          Positioned(
            left: Get.find<AppPreferences>().getLang == Keys.ar ? 5.0.w : null,
            right: Get.find<AppPreferences>().getLang != Keys.ar ? 5.0.w : null,
            bottom: 3.0.h,
            child: _ChatDateTime(
              time: widget.dateTime!,
              isMe: widget.isMe,
              isFile: widget.isFile,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatVoiceFileBody extends StatelessWidget {
  const ChatVoiceFileBody({super.key, required this.audio, required this.time});
  final String audio, time;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      alignment: AlignmentDirectional.center,
      child: Stack(
        children: [
          VoiceMessageView(
            backgroundColor: KColors.fillColor,
            circlesColor: KColors.black,
            notActiveSliderColor: KColors.fillColor.withOpacity(0.4),
            activeSliderColor: KColors.black,
            counterTextStyle: gStyle12(
              color: KColors.black,
              fontWeight: FontWeight.w500,
            ),
            circlesTextStyle: gStyle10(
              color: KColors.black,
              fontWeight: FontWeight.w800,
            ),
            controller: VoiceController(
              audioSrc: audio,
              maxDuration: const Duration(seconds: 160),
              isFile: true,
              onComplete: () {},
              onPause: () {},
              onPlaying: () {},
            ),
            innerPadding: 2.h,
            cornerRadius: 6.r,
          ),
          /* Positioned(
            left: 5.0.w,
            bottom: 3.0.h,
            child: ChatDateTimeBody(
              dateTime: dateTime,
              isMe: isMe,
            ),
          ), */
        ],
      ),
    );
  }
}

class _VoiceManager {
  static final _VoiceManager _instance = _VoiceManager._internal();

  factory _VoiceManager() => _instance;

  _VoiceManager._internal();

  final Map<String, VoiceController> _controllers = {};

  VoiceController voiceCtrl(String url, bool isFile) {
    if (_controllers.containsKey(url)) {
      _controllers[url]?.stopPlaying();
      // _controllers[url]?.dispose();
    }

    final VoiceController controller = VoiceController(
      audioSrc: url,
      isFile: isFile,
      maxDuration: const Duration(seconds: 180),
      onComplete: () {},
      onPause: () {},
      onPlaying: () {
        _controllers.forEach(
          (key, value) {
            if (!key.isEmptyOrNul && value.isPlaying) {
              value.stopPlaying();
            }
          },
        );
      },
    );

    _controllers[url] = controller;
    controller.init();
    return controller;
  }

  Future<void> dispose(
    String url,
  ) async {
    if (_controllers.containsKey(url)) {
      final VoiceController? controller = _controllers[url];
      if (controller == null) return;
      if (controller.isInit || controller.isPlaying) {
        await controller.stopPlaying();
        await controller.dispose();
      }
    }
  }
  /* Future<void> disposeCtrl(String url) async {
    if (_controllers.containsKey(url)) {
      final VoiceController? controller = _controllers[url];
      if (controller != null) {
        await controller.stopPlaying();
        // controller.animController.dispose();
        // await controller.dispose();
      }
    }
  } */
}
