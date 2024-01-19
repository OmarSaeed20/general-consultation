part of 'message_body.dart';

class TextChatWidget extends StatelessWidget {
  const TextChatWidget({
    super.key,
    required this.isCurrentChat,
    required this.text,
    this.time = "",
  });
  final bool isCurrentChat;
  final String text, time;

  @override
  Widget build(BuildContext context) {
    final bool isTextRTL = Utils.getDirection(text) == TextDirection.rtl;

    return _ChatHolderWidget(
      isMe: isCurrentChat,
      time: time,
      child: TextWidget(
        text,
        textAlign: Utils.isRTL
            ? isTextRTL
                ? TextAlign.start
                : TextAlign.end
            : isTextRTL
                ? TextAlign.end
                : TextAlign.start,
        style: gStyle14(
          color: isCurrentChat ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
