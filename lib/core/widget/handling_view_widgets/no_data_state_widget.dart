import '/index.dart';
import 'costum_bage_state_widget.dart';

class NoDataStateWidget extends StatelessWidget {
  const NoDataStateWidget({
    super.key,
    this.onTap,
    required this.rx,
    this.title,
    this.sup,
    this.image,
  });
  final void Function()? onTap;
  final RequestState rx;
  final String? title, sup, image;

  @override
  Widget build(BuildContext context) => CustomBageStateWidget(
        // image: image ?? Kimage.done,
        title: title ?? "Empty!!",
        supTitle: sup.valide(),
        onTap: onTap,
        rx: rx,
      );
}
