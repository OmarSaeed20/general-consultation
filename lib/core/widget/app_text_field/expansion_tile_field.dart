import '/index.dart';

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({
    super.key,
    required this.array,
    required this.title,
    required this.subTitle,
    required this.onSelectedValue,
    this.borderColor,
    this.backgroundColor,
  });
  final List array;
  final String title, subTitle;
  final ValueChanged<int> onSelectedValue;
  final Color? borderColor, backgroundColor;

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  final ExpansionTileController _controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(widget.title, style: gStyle14()),
        12.sH,
        ExpansionTile(
          controller: _controller,
          childrenPadding: gPadding(right: 5, left: 5),
          tilePadding: gPadding(right: 15, top: -2.5, left: 15, bottom: -2.5),
          iconColor: KColors.grey,
          clipBehavior: Clip.hardEdge,
          collapsedBackgroundColor: widget.backgroundColor,
          backgroundColor: widget.backgroundColor,
          trailing: const Icon(Icons.keyboard_arrow_down_rounded),
          shape: RoundedRectangleBorder(
            borderRadius: 30.radius,
            side: BorderSide(
                width: 1.5, color: widget.borderColor ?? KColors.fillBorder),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: 30.radius,
            side: BorderSide(color: widget.borderColor ?? KColors.fillBorder),
          ),
          title: TextWidget(
            widget.subTitle,
            style: gStyle12(color: KColors.textGray),
          ),
          children: List.generate(
            widget.array.length,
            (index) => TextButton(
              onPressed: () {
                widget.onSelectedValue(index);
                _controller.collapse();
                setState(() {});
              },
              style: TextButton.styleFrom(
                fixedSize: const Size.fromWidth(double.maxFinite),
                alignment: AlignmentDirectional.centerStart,
              ),
              child: TextWidget(
                widget.array[index],
                style: gStyle14(color: KColors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
