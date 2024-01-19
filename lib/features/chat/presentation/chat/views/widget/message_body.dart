import 'package:flutter/cupertino.dart';
import 'package:general_consultation/index.dart';
import 'package:photo_view/photo_view.dart';

part 'chat_holder_wid.dart';
part 'chat_voice_body.dart';
part 'text_chat_widget.dart';
part 'chat_text_failed.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({
    super.key,
    required this.message,
    required this.isMe,
    required this.index,
  });

  final int index;
  final MessageEntity message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return AnimationListWidget(
      index: index,
      curve: Curves.easeIn,
      horizontal: 30,
      child: switch (message.type) {
        'file' => _ChatHolderWidget(
            isMe: isMe,
            time: message.createdAt.valide(),
            child: ChatImageBody(
              url: message.message.valide(),
              isChat: true,
            )),
        'audio' => ChatVoiceBody(
            isMe: isMe,
            audioSrc: message.message.valide(),
            dateTime: message.createdAt.valide(),
          ),
        _ => TextChatWidget(
            isCurrentChat: isMe,
            text: message.message.valide(),
            time: message.createdAt.valide(),
          )
      },
    );
  }
}
