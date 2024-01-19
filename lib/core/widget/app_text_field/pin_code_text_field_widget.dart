import 'dart:async';

import '/index.dart';

class PinCodeTextFieldWidget extends StatelessWidget {
  const PinCodeTextFieldWidget({
    super.key,
    required this.lenght,
    required this.onChanged,
    required this.errorAnimationController,
  });
  final int lenght;
  final void Function(String) onChanged;
  final StreamController<ErrorAnimationType> errorAnimationController;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: lenght,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      textStyle: gStyle14(fontSize: 13, color: KColors.black),
      onChanged: onChanged,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        borderRadius: 40.radius,
        fieldHeight: 55.h,
        fieldWidth: 55.h,
        inactiveBorderWidth: 0.70.w,
        activeFillColor: KColors.white,
        inactiveColor: const Color(0xFFE2E2E2),
        selectedColor: const Color(0xffF2C94C),
        activeColor: KColors.primaryDark,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: false,
      errorAnimationController: errorAnimationController,
      appContext: context,
    );
  }
}
