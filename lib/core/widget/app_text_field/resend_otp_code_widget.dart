import '/index.dart';

class ResendOtpCodeWidget extends StatelessWidget {
  const ResendOtpCodeWidget({
    super.key,
    required this.isLoading,
    this.onPressed,
    required this.timer,
  });
  final bool isLoading;
  final VoidCallback? onPressed;
  final String timer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            Kstrings.havenotReceivedOtp.tr,
            textAlign: TextAlign.center,
            style: gStyle16(fontWeight: FontWeight.w500),
          ),
          if (isLoading) ...{5.sH},
          isLoading
              ? const LoadingWidget(color: KColors.primary)
              : TextButton(
                  onPressed: onPressed,
                  child: TextWidget(
                    timer,
                    textAlign: TextAlign.center,
                    style: gStyle16(
                      color: KColors.primary,
                      decoration: int.tryParse(timer) == 0
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
