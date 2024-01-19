import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../consts/app_colors.dart';
import '/core/util/extensions.dart';
import 'package:get/get.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
    required this.child,
    required this.isLoading,
  });
  final Widget child;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          child,
          if (isLoading)
            Container(
              width: context.width,
              height: context.height,
              color: Colors.grey.withOpacity(.5),
              child: Center(
                child: Container(
                  padding: gPaddingAll(10),
                  decoration: BoxDecoration(
                    borderRadius: 10.radius,
                    color: KColors.white,
                  ),
                  height: 50.h,
                  width: 50.h,
                  child: const CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(KColors.primary),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
