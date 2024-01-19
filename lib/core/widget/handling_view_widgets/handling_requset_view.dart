import '/index.dart';
import 'costum_bage_state_widget.dart';

class HandlingRequstView extends StatelessWidget {
  const HandlingRequstView(
    this.rx, {
    super.key,
    required this.child,
    this.loading,
    this.onTap,
    this.title,
    this.sub,
    this.image,
    this.padding,
  });
  final RequestState rx;
  final Widget? loading;
  final String? title, sub, image;
  final Widget child;
  final EdgeInsetsDirectional? padding;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) => switch (rx) {
        RequestState.loading => loading ?? const SizedBox.shrink(),
        RequestState.offLineFailure => Padding(
            padding: padding ?? gPadding(),
            child: Center(child: OfflineInterNetWidget(onTap: onTap, rx: rx)),
          ),
        RequestState.empty => Padding(
            padding: padding ?? gPadding(),
            child: Center(
                child: CustomBageStateWidget(
              image: image,
              rx: rx,
              title: title.valide(),
              supTitle: sub.valide(),
            ))),
        _ => child
      };
}
