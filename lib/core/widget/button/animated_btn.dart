import '/index.dart';

class ProgressButton extends StatefulWidget {
  final Map<RequestState, Widget> stateWidgets;
  final Map<RequestState, Color> stateColors;
  final Function? onPressed;
  final Function? onAnimationEnd;
  final RequestState? state;
  final double minWidth;
  final double maxWidth;
  final double radius;
  final double height;
  final ProgressIndicator? progressIndicator;
  final double progressIndicatorSize;
  final MainAxisAlignment progressIndicatorAlignment;
  final EdgeInsets padding;
  final List<RequestState> minWidthStates;
  final Duration animationDuration;

  ProgressButton({
    super.key,
    required this.stateWidgets,
    required this.stateColors,
    this.state = RequestState.none,
    this.onPressed,
    this.onAnimationEnd,
    this.minWidth = 200.0,
    this.maxWidth = 400.0,
    this.radius = 40.0,
    this.height = 53.0,
    this.progressIndicatorSize = 35.0,
    this.progressIndicator,
    this.progressIndicatorAlignment = MainAxisAlignment.spaceBetween,
    this.padding = EdgeInsets.zero,
    this.minWidthStates = const <RequestState>[RequestState.loading],
    this.animationDuration = const Duration(milliseconds: 500),
  })  : assert(
          stateWidgets.keys.toSet().containsAll(RequestState.values.toSet()),
          'Must be non-null widgetds provided in map of stateWidgets. Missing keys => ${RequestState.values.toSet().difference(stateWidgets.keys.toSet())}',
        ),
        assert(
          stateColors.keys.toSet().containsAll(RequestState.values.toSet()),
          'Must be non-null widgetds provided in map of stateWidgets. Missing keys => ${RequestState.values.toSet().difference(stateColors.keys.toSet())}',
        );

  @override
  State<StatefulWidget> createState() => _ProgressRequestState();

  factory ProgressButton.icon({
    required Map<RequestState, IconedButton> iconedButtons,
    Function? onPressed,
    RequestState? state = RequestState.none,
    Function? animationEnd,
    maxWidth = 170.0,
    minWidth = 58.0,
    height = 53.0,
    radius = 40,
    progressIndicatorSize = 35.0,
    double iconPadding = 4.0,
    TextStyle? textStyle,
    CircularProgressIndicator? progressIndicator,
    MainAxisAlignment? progressIndicatorAlignment,
    EdgeInsets padding = EdgeInsets.zero,
    List<RequestState> minWidthStates = const <RequestState>[
      RequestState.loading
    ],
  }) {
    assert(
      iconedButtons.keys.toSet().containsAll(RequestState.values.toSet()),
      'Must be non-null widgets provided in map of stateWidgets. Missing keys => ${RequestState.values.toSet().difference(iconedButtons.keys.toSet())}',
    );

    textStyle ??= gStyle16(fontWeight: FontWeight.w700);

    Map<RequestState, Widget> stateWidgets = {
      RequestState.none: buildChildWithIcon(
        iconedButtons[RequestState.none]!,
        iconPadding,
        textStyle,
      ),
      RequestState.loading: const Column(),
      RequestState.error: buildChildWithIcon(
        iconedButtons[RequestState.error]!,
        iconPadding,
        textStyle,
      ),
      RequestState.success: buildChildWithIcon(
        iconedButtons[RequestState.success]!,
        iconPadding,
        textStyle,
      )
    };

    Map<RequestState, Color> stateColors = {
      RequestState.none: iconedButtons[RequestState.none]!.color,
      RequestState.loading: iconedButtons[RequestState.loading]!.color,
      RequestState.error: iconedButtons[RequestState.error]!.color,
      RequestState.success: iconedButtons[RequestState.success]!.color,
    };

    return ProgressButton(
      stateWidgets: stateWidgets,
      stateColors: stateColors,
      state: state,
      onPressed: onPressed,
      onAnimationEnd: animationEnd,
      maxWidth: maxWidth,
      minWidth: minWidth,
      radius: radius,
      height: height,
      progressIndicatorSize: progressIndicatorSize,
      progressIndicatorAlignment: MainAxisAlignment.center,
      progressIndicator: progressIndicator,
      minWidthStates: minWidthStates,
    );
  }
}

class _ProgressRequestState extends State<ProgressButton>
    with TickerProviderStateMixin {
  AnimationController? colorAnimationController;
  Animation<Color?>? colorAnimation;
  double? width;
  Widget? progressIndicator;

  void startAnimations(RequestState? oldState, RequestState? newState) {
    Color? begin = widget.stateColors[oldState!];
    Color? end = widget.stateColors[newState!];
    if (widget.minWidthStates.contains(newState)) {
      width = widget.minWidth;
    } else {
      width = widget.maxWidth;
    }
    colorAnimation = ColorTween(begin: begin, end: end).animate(CurvedAnimation(
      parent: colorAnimationController!,
      curve: const Interval(0, 1, curve: Curves.easeIn),
    ));
    colorAnimationController!.forward();
  }

  Color? get backgroundColor => colorAnimation == null
      ? widget.stateColors[widget.state!]
      : colorAnimation!.value ?? widget.stateColors[widget.state!];

  @override
  void initState() {
    super.initState();

    width = widget.maxWidth;

    colorAnimationController =
        AnimationController(duration: widget.animationDuration, vsync: this);
    colorAnimationController!.addStatusListener(
      (status) {
        if (widget.onAnimationEnd != null) {
          widget.onAnimationEnd!(status, widget.state);
        }
      },
    );

    progressIndicator = widget.progressIndicator ??
        CircularProgressIndicator(
          backgroundColor: widget.stateColors[widget.state!],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        );
  }

  @override
  void dispose() {
    colorAnimationController!.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ProgressButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.state != widget.state) {
      colorAnimationController?.reset();
      startAnimations(oldWidget.state, widget.state);
    }
  }

  Widget getButtonChild(bool visibility) {
    Widget? buttonChild = widget.stateWidgets[widget.state!];
    if (widget.state == RequestState.loading) {
      return Row(
        mainAxisAlignment: widget.progressIndicatorAlignment,
        children: <Widget>[
          SizedBox(
            width: widget.progressIndicatorSize.w,
            height: widget.progressIndicatorSize.h,
            child: progressIndicator,
          ),
          buttonChild ?? const SizedBox.shrink(),
          10.sW,
        ],
      );
    }
    return AnimatedOpacity(
      opacity: visibility ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      child: buttonChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimationController!,
      builder: (context, child) {
        return AnimatedContainer(
          width: width?.w,
          height: widget.height.h,
          duration: widget.animationDuration,
          child: MaterialButton(
            padding: widget.padding,
            shape: RoundedRectangleBorder(
              borderRadius: widget.radius.radius,
              // side: const BorderSide(color: Colors.transparent, width: 0),
            ),
            color: backgroundColor,
            onPressed: widget.onPressed as void Function()?,
            child: getButtonChild(
              colorAnimation == null ? true : colorAnimation!.isCompleted,
            ),
          ),
        );
      },
    );
  }
}

Widget buildChildWithIcon(
  IconedButton iconedButton,
  double iconPadding,
  TextStyle textStyle,
) =>
    _buildChildWithIC(
      iconedButton.text,
      iconedButton.icon,
      iconPadding,
      textStyle,
    );

Widget _buildChildWithIC(
    String? text, Icon? icon, double gap, TextStyle textStyle) {
  var children = <Widget>[];
  children.add(icon ?? const SizedBox.shrink());
  if (text != null) {
    children.add(Padding(padding: gPaddingAll(gap)));
    children.add(_buildText(text, textStyle));
  }

  return Wrap(
    direction: Axis.horizontal,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: children,
  );
}

Widget _buildText(String text, TextStyle style) =>
    TextWidget(text, style: style);

//// >>>>>>>>>>>>>>
class IconedButton extends Equatable {
  final String? text;
  final Icon? icon;
  final Color color;

  const IconedButton({this.text, this.icon, required this.color});

  @override
  List<Object?> get props => [text, icon, color];
}
