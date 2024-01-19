import 'package:flutter/cupertino.dart';

import '/index.dart';

class ExpandableTextWidget extends StatefulWidget {
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double heightText = ScreenUtil().screenHeight / 9.15;

  @override
  void initState() {
    super.initState();
    _updateText();
  }

  @override
  void didUpdateWidget(ExpandableTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      _updateText();
    }
  }

  void _updateText() {
    if (widget.text.length > heightText) {
      firstHalf = widget.text.substring(0, heightText.toInt());
      secondHalf =
          widget.text.substring(heightText.toInt(), widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool isTextRTL = Utils.getDirection(widget.text) == TextDirection.rtl;
    return Container(
      child: secondHalf.isEmpty
          ? TextWidget(
              firstHalf,
              style: gStyle14(),
              padding: gPadding(left: 15),
              textAlign: Utils.isRTL
                  ? isTextRTL
                      ? TextAlign.start
                      : TextAlign.end
                  : isTextRTL
                      ? TextAlign.end
                      : TextAlign.start,
            )
          : Wrap(
              children: [
                TextWidget(
                  hiddenText ? ('$firstHalf ...') : (firstHalf + secondHalf),
                  overflow: TextOverflow.clip,
                  textAlign: Utils.isRTL
                      ? isTextRTL
                          ? TextAlign.start
                          : TextAlign.end
                      : isTextRTL
                          ? TextAlign.end
                          : TextAlign.start,
                  style: gStyle14(),
                  padding: gPadding(left: 15),
                  /*    style: gStyle14(/* fontSize: 11 */),
                  padding: gPadding(left: 34, bottom: 8), */
                ),
                2.5.sH,
                GestureDetector(
                  onTap: () => setState(() => hiddenText = !hiddenText),
                  child: Row(
                    children: [
                      TextWidget(
                        hiddenText ? 'Show more'.tr : 'Show less'.tr,
                        style: gStyle14(color: KColors.primary),
                        textAlign: Utils.isRTL
                            ? isTextRTL
                                ? TextAlign.start
                                : TextAlign.end
                            : isTextRTL
                                ? TextAlign.end
                                : TextAlign.start,
                      ),
                      5.sW,
                      Icon(
                        hiddenText
                            ? CupertinoIcons.chevron_down
                            : CupertinoIcons.chevron_up,
                        color: KColors.primary,
                        size: 16.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
