import '/index.dart';

class IconBackWidget extends StatelessWidget {
  const IconBackWidget({super.key, this.padding});
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? gPadding(top: 5),
      child: IconButton.filled(
        style: const ButtonStyle(
          // minimumSize: WidgetStatePropertyAll(Size(20, 20)),
          // maximumSize: WidgetStatePropertyAll(Size(30, 40)),
          padding: WidgetStatePropertyAll(EdgeInsetsDirectional.all(0)),
          // iconSize: WidgetStatePropertyAll(24),
          backgroundColor: WidgetStatePropertyAll(KColors.transparent),
          iconColor: WidgetStatePropertyAll(KColors.primaryDark),
          shape: WidgetStatePropertyAll(
            CircleBorder(
                // side: BorderSide(color: KColors.grey),
                ),
          ),
        ),
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
