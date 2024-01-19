part of 'message_body.dart';

class _ChatHolderWidget extends StatelessWidget {
  const _ChatHolderWidget({
    required this.isMe,
    required this.child,
    required this.time,
  });
  final bool isMe;
  final Widget child;
  final String time;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: gPaddingSymmetric(vertical: 5),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: 6.radius,
              color: isMe ? KColors.primary : KColors.greyLight,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.width * (0.7)),
              child: Padding(
                padding: gPaddingSymmetric(horizontal: 5, vertical: 10),
                child: _BodyTextOrImage(time: time, isMe: isMe, child: child),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _BodyTextOrImage extends StatelessWidget {
  const _BodyTextOrImage({
    required this.child,
    required this.time,
    required this.isMe,
  });

  final Widget child;
  final String time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        ...[
          5.sH,
          _ChatDateTime(time: time, isMe: isMe),
        ],
      ],
    );
  }
}

class _ChatDateTime extends StatelessWidget {
  const _ChatDateTime({
    required this.time,
    required this.isMe,
    this.isFile = false,
  });

  final String time;
  final bool isMe, isFile;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isMe && !isFile) ...[
            const Icon(Icons.done_all, color: KColors.white, size: 12),
            4.sW,
          ],
          TextWidget(
            (time).chatDateWithTimeFormat,
            textAlign: TextAlign.start,
            style: gStyle12(
              fontWeight: FontWeight.w500,
              color: isMe ? KColors.white : KColors.black,
            ),
          ),
        ],
      );
}

/* class _BodyVoice extends StatelessWidget {
  const _BodyVoice({
    required this.child,
    required this.time,
    required this.isMe,
  });

  final Widget child;
  final String time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ...[
          Positioned(
            bottom: 0,
            right: 0,
            child: _ChatDateTime(time: time, isMe: isMe),
          ),
        ],
      ],
    );
  }
}
 */

