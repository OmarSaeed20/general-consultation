import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/util/extensions.dart';
import '../consts/app_colors.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget>
    with TickerProviderStateMixin {
  bool isChecked = false;
  final Duration _duration = const Duration(milliseconds: 370);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _animation =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Center(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(
              () {
                if (_animationController.isCompleted) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
                isChecked = !isChecked;
              },
            );
          },
          child: Container(
            width: 44.w,
            height: 24.h,
            // padding: gPaddingSymmetric(vertical: .5.h),
            decoration: BoxDecoration(
              color: isChecked ? Colors.green : Colors.red,
              borderRadius: BorderRadius.all(24.radiusCircular),
              boxShadow: [
                BoxShadow(
                  color: isChecked
                      ? KColors.primary.withOpacity(0.6)
                      : KColors.grey,
                  blurRadius: 24,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Stack(
              children: [
                Align(
                  alignment: _animation.value,
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          if (_animationController.isCompleted) {
                            _animationController.reverse();
                          } else {
                            _animationController.forward();
                          }
                          isChecked = !isChecked;
                        },
                      );
                    },
                    child: Container(
                      width: 10.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
