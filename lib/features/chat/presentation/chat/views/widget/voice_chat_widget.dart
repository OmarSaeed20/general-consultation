/* // import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'dart:io';

// import 'package:audio_waveforms_example/chat_bubble.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path_provider/path_provider.dart';

import '/index.dart';
// import 'chat_text_failed.dart';

class VoiceChatWidget extends StatefulWidget {
  const VoiceChatWidget({
    super.key,
    required this.url,
    required this.isCurrentChat,
    required this.time,
  });

  final String url, time;
  final bool isCurrentChat;

  @override
  State<VoiceChatWidget> createState() => _VoiceChatWidgetState();
}

class _VoiceChatWidgetState extends State<VoiceChatWidget>
    with AutomaticKeepAliveClientMixin {
  final AudioPlayer player = AudioPlayer();
  Duration? get duration => _duration;
  int get durationInSeconds => duration?.inSeconds ?? 0;
  int get durationInMinutes => duration?.inMinutes ?? 0;
  String get getPositionProgress =>
      '${position.inMinutes.getDurationReminder}:${position.inSeconds.remainder(60).getDurationReminder}';
  String get getDurationProgress =>
      '${durationInMinutes.getDurationReminder}:${durationInSeconds.remainder(60).getDurationReminder}';

  Duration _position = const Duration();
  Duration _duration = const Duration();
  bool _isPlaying = false;

  initPlayer() async {
    await player.setSourceUrl(widget.url);

    player.onPositionChanged.listen((event) {
      _position = event;
      if (mounted) {
        setState(() {});
      }
    });
    player.onDurationChanged.listen((event) {
      _duration = event;
      if (mounted) {
        setState(() {});
      }
    });
    player.onPlayerStateChanged.listen((event) {
      _isPlaying = event == PlayerState.playing;
      if (mounted) {
        setState(() {});
      }
    });
    player.onPlayerComplete.listen((event) {
      _position = const Duration(seconds: 0);
      if (mounted) {
        setState(() {});
      }
    });
    setState(() {});
  }

  @override
  initState() {
    initPlayer();
    super.initState();
  }

  @override
  dispose() {
    player.dispose();
    super.dispose();
  }

  play() => player.play(UrlSource(widget.url));
  pause() async => await player.pause();

  seekTo(Duration value) async => await player.seek(value);

  Duration get position => _position;
  togglePlayer() => switch (_isPlaying) { true => pause(), false => play() };

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChatHolderWidget(
      isMe: widget.isCurrentChat,
      time: widget.time,
      isVoice: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: togglePlayer,
            child: Icon(
              _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              size: 28,
              color: widget.isCurrentChat ? KColors.white : KColors.primary,
            ),
          ),
          TextWidget(
            getPositionProgress,
            style: gStyle14(
              fontSize: 13,
              color: widget.isCurrentChat ? KColors.white : KColors.primary,
            ),
          ),
          Expanded(
            child: Slider(
              activeColor:
                  widget.isCurrentChat ? KColors.white : KColors.primary,
              inactiveColor: widget.isCurrentChat
                  ? KColors.white.withOpacity(.2)
                  : KColors.primary.withOpacity(.2),
              thumbColor: Colors.white,
              min: 0,
              max: duration?.inSeconds.toDouble() ?? 0.0,
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                seekTo(Duration(seconds: value.toInt()));
              },
            ),
          ),
          TextWidget(
            getDurationProgress,
            style: gStyle14(
              fontSize: 13,
              color: widget.isCurrentChat ? KColors.white : KColors.primary,
            ),
          ),
          5.sW,
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/* 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final RecorderController recorderController;

  String? path;
  String? musicFile;
  bool isRecording = false;
  bool isRecordingCompleted = false;
  bool isLoading = true;
  late Directory appDirectory;

  @override
  void initState() {
    super.initState();
    _getDir();
    _initialiseControllers();
  }

  void _getDir() async {
    appDirectory = await getApplicationDocumentsDirectory();
    path = "${appDirectory.path}/recording.m4a";
    isLoading = false;
    setState(() {});
  }

  void _initialiseControllers() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      musicFile = result.files.single.path;
      setState(() {});
    } else {
      //debugPrint("File not picked");
    }
  }

  @override
  void dispose() {
    recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252331),
      appBar: AppBar(
        backgroundColor: const Color(0xFF252331),
        elevation: 1,
        centerTitle: true,
        shadowColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*  Image.asset(
              'assets/images/logo.png',
              scale: 1.5,
            ), */
            const SizedBox(width: 10),
            const Text('Simform'),
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  /* Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return WaveBubble(
                          index: index + 1,
                          isSender: index.isOdd,
                          width: MediaQuery.of(context).size.width / 2,
                          appDirectory: appDirectory,
                        );
                      },
                    ),
                  ),
                  if (isRecordingCompleted)
                    WaveBubble(
                      path: path,
                      isSender: true,
                      appDirectory: appDirectory,
                    ),
                  if (musicFile != null)
                    WaveBubble(
                      path: musicFile,
                      isSender: true,
                      appDirectory: appDirectory,
                    ),
                   */
                  SafeArea(
                    child: Row(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: isRecording
                              ? AudioWaveforms(
                                  enableGesture: true,
                                  size: Size(
                                    MediaQuery.of(context).size.width / 2,
                                    50,
                                  ),
                                  recorderController: recorderController,
                                  waveStyle: const WaveStyle(
                                    waveColor: Colors.white,
                                    extendWaveform: true,
                                    showMiddleLine: false,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: const Color(0xFF1E1B26),
                                  ),
                                  padding: const EdgeInsets.only(left: 18),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                )
                              : Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.7,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E1B26),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.only(left: 18),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: TextField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: "Type Something...",
                                      hintStyle: const TextStyle(
                                          color: Colors.white54),
                                      contentPadding:
                                          const EdgeInsets.only(top: 16),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        onPressed: _pickFile,
                                        icon: Icon(Icons.adaptive.share),
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        IconButton(
                          onPressed: _refreshWave,
                          icon: Icon(
                            isRecording ? Icons.refresh : Icons.send,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: _startOrStopRecording,
                          icon: Icon(isRecording ? Icons.stop : Icons.mic),
                          color: Colors.white,
                          iconSize: 28,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _startOrStopRecording() async {
    try {
      if (isRecording) {
        recorderController.reset();

        final path = await recorderController.stop(false);

        if (path != null) {
          isRecordingCompleted = true;
          //debugPrint(path);
          //debugPrint("Recorded file size: ${File(path).lengthSync()}");
        }
      } else {
        await recorderController.record(path: path!);
      }
    } catch (e) {
      //debugPrint(e.toString());
    } finally {
      setState(() {
        isRecording = !isRecording;
      });
    }
  }

  void _refreshWave() {
    if (isRecording) recorderController.refresh();
  }
}
 */
/* 
class CardTextFieldContent extends StatelessWidget {
  const CardTextFieldContent({super.key});

  @override
  Widget build(BuildContext context) {
    ChatControllerImp controller = Get.find<ChatControllerImp>();
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: gPadding(right: 10, top: 15, left: 10, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: controller.state.value.isRecording
                        ? Row(
                            children: [
                              Expanded(
                                child: 
                                TextWidget("${Kstrings.recording.tr} ..."),
                              /* AudioWaveforms(
                                  enableGesture: true,
                                  size: Size(
                                    MediaQuery.of(context).size.width / 2,
                                    50,
                                  ),
                                  recorderController:
                                      controller.state.value.recorderController,
                                  waveStyle: const WaveStyle(
                                    waveColor: KColors.primary,
                                    extendWaveform: true,
                                    showMiddleLine: true,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: 12.radius,
                                    color: KColors.primaryDark,
                                  ),
                                  padding: const EdgeInsets.only(left: 18),
                                  // margin: const EdgeInsets.symmetric(horizontal: 15),
                                ), */
                              ),
                              TxtBtn(
                                const Icon(Icons.stop_rounded),
                                onTap: () => controller.toggleRecorder(),
                              )
                            ],
                          )
                        : ChatTextField(
                            fillColor: KColors.fillColor2,
                            borderRadius: 30,
                            hintText: Kstrings.writeHere.tr,
                            // enabled: !controller.state.value.isRecording,
                            prefixIcon: ImageWidget(
                              path: Kimage.gallery,
                              onTap: () => controller.pickImage(),
                            ),
                            textEditingController:
                                controller.state.value.message,
                            isTitle: false,
                            suffixIcon: ImageWidget(
                              path: Kimage.microphone,
                              color: controller.state.value.isRecording
                                  ? KColors.primary
                                  : null,
                              onTap: () => controller.toggleRecorder(),
                              height: 20,
                            ),
                          ),
                  ),
                ),
                Center(
                  child: !controller.state.value.rxsend.isLoading
                      ? ImageWidget(
                          onTap: () => controller.sendMessage(),
                          path: Kimage.send,
                          color:
                              controller.state.value.message.value.text.isEmpty
                                  ? KColors.textGray
                                  : KColors.primary,
                        )
                      : const LoadingWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} */
 */