import 'package:flutter/cupertino.dart';
 
import '/index.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.model});
  final AllChatData model;
  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: KColors.fillBorder, width: .3.w),
        ),
        child: ListTile(
          onTap: () => Get.toNamed(
            Routes.chat,
            arguments: {
              "chat_id": model.id,
              "vendor_id": model.vendorId,
              "vendor_image": model.vendor?.image,
              "vendor_name": model.vendor?.name,
            },
          ),
          /* shape: BeveledRectangleBorder(
            side: BorderSide(color: KColors.fillBorder, width: .3.w),
          ), */
          isThreeLine: false,
          leading: CircleImageNetWork(url: model.vendor!.image!, size: 56),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                model.vendor?.name,
                style: gStyle16(fontWeight: FontWeight.w700),
              ),
              TextWidget(
                model.createdAt?.chatDateFormat,
                style: gStyle14(fontSize: 11, color: const Color(0xFFAEAEAE)),
              )
            ],
          ),
          subtitle: Padding(
            padding: gPadding(top: 10),
            child: ShowLastMasseg(
              model.lastMessage!.message!,
              msgType: model.lastMessage!.type,
              isMe: model.lastMessage?.userId == model.customerId,
            ),
          ),
        ),
      );
}

class ShowLastMasseg extends StatelessWidget {
  const ShowLastMasseg(
    this.message, {
    super.key,
    this.msgType,
    this.isMe = false,
  });
  final String message;
  final bool isMe;
  final String? msgType;
  @override
  Widget build(BuildContext context) => Row(
        children: [
          if (isMe) ...[
            const Icon(Icons.done_all, color: KColors.textGray2, size: 12),
            4.sW,
            TextWidget("You: ".tr, style: gStyle14(color: KColors.textGray2)),
          ],
          checkFileType(message),
        ],
      );

  Widget checkFileType(String link) {
    String fileType = msgType ?? Utils.getFileType(link);

    return switch (fileType) {
      ("docx" || 'pdf') => _body(Kstrings.file.tr, icon: Icons.attach_file),
      ("m4a" || 'audio') =>
        _body(Kstrings.voice.tr, icon: CupertinoIcons.headphones),
      'video' => _body(Kstrings.video.tr, icon: Icons.video_library_outlined),
      ("string" || 'text') => TextWidget(
          message,
          style: gStyle12(color: KColors.textGray4),
          overflow: TextOverflow.ellipsis,
        ),
      _ => _body(Kstrings.photo.tr, img: Kimage.gallery),
    };
  }

  _body(String name, {IconData? icon, String? img}) => Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18.h, color: KColors.textGray2),
          ] else if (!img.isEmptyOrNul) ...[
            CircleImageSvg(
                path: img!, borderColor: KColors.transparent, size: 18)
          ],
          TextWidget(" $name", style: gStyle14(color: KColors.textGray2)),
        ],
      );
}
