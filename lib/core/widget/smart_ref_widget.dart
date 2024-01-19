// import 'dart:math';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:general_consultation/index.dart';
/* import 'package:general_consultation/core/consts/app_colors.dart';
import 'package:general_consultation/core/consts/app_images.dart';
import 'package:general_consultation/core/widget/image_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart'; */

/* class SmartRefreshWidget extends StatelessWidget {
  const SmartRefreshWidget({
    super.key,
    required this.onRefresh,
    required this.controller,
    required this.child,
    this.scrollController,
  });
  final void Function()? onRefresh;
  final RefreshController controller;
  final Widget child;
  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) => SmartRefresher(
        onRefresh: onRefresh,
        scrollController: scrollController,
        header: const WaterDropHeader(waterDropColor: KColors.primary),
        enablePullDown: true,
        enablePullUp: false,
        controller: controller,
        child: child,
      );
} */
class SmartRefreshWidget extends StatelessWidget {
  const SmartRefreshWidget({
    super.key,
    required this.onRefresh,
    required this.refCtrl,
    required this.child,
    required this.listenable,
    this.scrCtrl,
    this.clamping = true,
    this.position = IndicatorPosition.locator,
    this.onLoad,
  });
  final Future<void> Function()? onRefresh, onLoad;
  final EasyRefreshController? refCtrl;
  final Widget child;
  final bool clamping;
  final IndicatorPosition position;
  final IndicatorStateListenable listenable;
  final ScrollController? scrCtrl;
  @override
  Widget build(BuildContext context) => EasyRefresh(
/*         header: MaterialHeader(
          clamping: clamping,
          position: position,
        ), */
        /*  header: BuilderHeader(
          clamping: false,
          position: IndicatorPosition.locator,
          triggerOffset: 100000,
          notifyWhenInvisible: true,
          builder: (context, state) {
            const expandedExtent = 120.0 - kToolbarHeight;
            final pixels = state.notifier.position.pixels;
            final height = state.offset + 80.0;
            final clipEndHeight = pixels < expandedExtent
                ? 80.0
                : max(0.0, 80.0 - pixels + expandedExtent);
            final imgHeight = pixels < expandedExtent
                ? 80.0
                : max(0.0, 80.0 - (pixels - expandedExtent));
            return Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: _TrapezoidClipper(
                    height: height,
                    clipStartHeight: 0.0,
                    clipEndHeight: clipEndHeight,
                  ),
                  child: Container(
                    height: height,
                    width: double.infinity,
                    color: KColors.primary,
                  ),
                ),
                Positioned(
                  top: -1,
                  left: 0,
                  right: 0,
                  child: ClipPath(
                    clipper: _FillLineClipper(imgHeight),
                    child: Container(
                      height: 2,
                      width: double.infinity,
                      color: KColors.primary,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ClipOval(
                    child: ImageWidget(
                      path: Kimage.user,
                      height: imgHeight,
                      width: imgHeight,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
         */
        header: ListenerHeader(
          triggerOffset: 100,
          listenable: listenable,
          safeArea: false,
        ),
        /*  header: BezierCircleHeader(
          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ), */
        resetAfterRefresh: true,
        controller: refCtrl,
        onRefresh: onRefresh,
        fit: StackFit.loose,
        // onLoad: onLoad,
        triggerAxis: Axis.vertical,
        scrollController: scrCtrl,
        child: child,
        // childBuilder: (context, physics) => child,
        /* {
          return NestedScrollView(
            physics: physics,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const HeaderLocator.sliver(clearExtent: false),
              ];
            },
            body: ListView(
              physics: physics,
            ),
          );
        } */
      );
}

class RefreshBody extends StatelessWidget {
  const RefreshBody({super.key, required this.listenable});

  final IndicatorStateListenable listenable;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topRight,
        child: ValueListenableBuilder<IndicatorState?>(
          valueListenable: listenable,
          builder: (context, state, _) {
            //debugPrint("mode >>>>>>>>> ${state?.mode}");
            if (state == null) {
              return const SizedBox();
            }
            final success = state.result == IndicatorResult.success;
            final mode = state.mode;
            final offset = state.offset;
            final actualTriggerOffset = state.actualTriggerOffset;
            double? value;
            if (mode == IndicatorMode.inactive) {
              value = 0;
            } else if (mode == IndicatorMode.processing) {
              value = null;
            } else if (mode == IndicatorMode.drag ||
                mode == IndicatorMode.armed) {
              value = min(offset / actualTriggerOffset, 1) * 0.75;
            } else if (mode == IndicatorMode.ready ||
                mode == IndicatorMode.processing) {
              //debugPrint("value  is  $value");
              // value == null;
            } else if (mode == IndicatorMode.done) {
              value = min(offset / actualTriggerOffset, 1) * 0.0;
            } else {
              value = 1;
            }
            Widget indicator;
            if (value != null && value < 0.1) {
              indicator = const SizedBox();
            } else if (value == 1) {
              indicator = Container(
                margin: gPaddingAll(4),
                padding: gPaddingAll(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5.w,
                    color: KColors.fillBorder,
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(-2, 2),
                        color: KColors.primary.withOpacity(.1)),
                    BoxShadow(
                        offset: const Offset(2, 2),
                        color: KColors.primary.withOpacity(.1)),
                  ],
                  shape: BoxShape.circle,
                  color: KColors.scaffoldBackground,
                ),
                child: Icon(
                  success
                      ? CupertinoIcons.hand_thumbsup_fill
                      : CupertinoIcons.hand_thumbsdown_fill,
                  /* ? CupertinoIcons.checkmark_circle_fill
                      : CupertinoIcons.xmark_circle_fill, */
                  size: 25.h,
                  color: success ? KColors.primary : KColors.red,
                ),
              );
            } else {
              indicator = RefreshProgressIndicator(value: value);
            }
            return SizedBox(
              width: 70.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    reverseDuration: const Duration(milliseconds: 100),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(scale: animation, child: child),
                    ),
                    child: indicator,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
/* 
class _FillLineClipper extends CustomClipper<Path> {
  final double imgHeight;

  _FillLineClipper(this.imgHeight);

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height / 2);
    path.lineTo(0, height / 2 + imgHeight / 2);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _FillLineClipper oldClipper) {
    return oldClipper.imgHeight != imgHeight;
  }
}

class _TrapezoidClipper extends CustomClipper<Path> {
  final double height;
  final double clipStartHeight;
  final double clipEndHeight;

  _TrapezoidClipper({
    required this.height,
    required this.clipStartHeight,
    required this.clipEndHeight,
  });

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height - clipEndHeight);
    path.lineTo(0, height - clipStartHeight);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_TrapezoidClipper oldClipper) {
    return oldClipper.height != height ||
        oldClipper.clipStartHeight != clipStartHeight ||
        oldClipper.clipEndHeight != clipEndHeight;
  }
}
 */