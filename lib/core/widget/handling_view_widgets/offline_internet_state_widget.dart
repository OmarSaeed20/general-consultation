import '/index.dart';
import 'costum_bage_state_widget.dart';

class OfflineInterNetWidget extends StatelessWidget {
  const OfflineInterNetWidget(
      {super.key, required this.onTap, required this.rx});
  final void Function()? onTap;
  final RequestState rx; 
  @override
  Widget build(BuildContext context) => CustomBageStateWidget(
        image: Kimage.offline,
        title: "No Connection !!".tr,
        supTitle:
            "Can't conection to server, chick your internet data and retry".tr,
        onTap: onTap,
        rx: rx,
      );
}
