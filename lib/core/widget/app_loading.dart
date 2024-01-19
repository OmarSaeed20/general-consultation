// import 'dart:math' as math;

// ignore_for_file: unused_element

import '../../index.dart';

/* import 'package:flutter/material.dart';
import '/core/util/app_colors.dart';

//A cicular loading indicator made up of colored dots. The current dot circles around the dot clockwise.
class AppLoading extends StatefulWidget {
  const AppLoading({
    Key? key,
    this.currentDotColor = KColors.primary,
    this.defaultDotColor = KColors.primaryDark,
    this.numDots = 8,
    this.size = 50,
    this.dotSize = 4,
    this.secondsPerRotation = 1500,
  }) : super(key: key);

  final int numDots; //Number of dots around the dot circle
  final double size; //Width and height of the
  final double dotSize; //Diameter of each dot
  final int secondsPerRotation;
  final Color
      currentDotColor; //The color of the dot that "circles" around the indicator
  final Color defaultDotColor; //The color of the dots that aren't animated

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<int> animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        duration: Duration(milliseconds: widget.secondsPerRotation),
        vsync: this)
      ..repeat();
    animation =
        StepTween(begin: 0, end: widget.numDots + 1).animate(animController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      // decoration: BoxDecoration(color: Colors.red), //for debugging purposes
      child: CustomPaint(
        painter: DottedCircularProgressIndicatorPainterFb(
          dotColor: widget.defaultDotColor,
          currentDotColor: widget.currentDotColor,
          percentage: 0,
          numDots: widget.numDots,
          currentDotNum: animation.value,
          dotWidth: widget.dotSize,
        ),
        child: const SizedBox.shrink(),
      ),
    );
  }
}

class DottedCircularProgressIndicatorPainterFb extends CustomPainter {
  final double percentage;
  final Color dotColor;
  final Color currentDotColor;
  final int numDots;
  final int currentDotNum;
  final double dotWidth;

  DottedCircularProgressIndicatorPainterFb({
    required this.dotColor,
    required this.currentDotColor,
    required this.percentage,
    required this.numDots,
    required this.dotWidth,
    required this.currentDotNum,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double smallestSide = math.min(size.width, size.height);
    final double radius = (smallestSide / 2 - dotWidth / 2) - dotWidth / 2;
    final Offset centerPoint = Offset(size.width / 2, size.height / 2);

    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = dotColor;

    Circle myCircle = Circle(radius: radius, totalNumOfDots: numDots);
    for (var i = 0; i < numDots; i++) {
      if (i == currentDotNum) {
        dotPaint.color = currentDotColor;
      } else {
        dotPaint.color = dotColor;
      }
      canvas.drawCircle(
        centerPoint - myCircle.calcDotOffsetFromCenter(i, radius),
        dotWidth,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(DottedCircularProgressIndicatorPainterFb oldDelegate) =>
      oldDelegate.currentDotNum != currentDotNum ? true : false;
}

//  Calculats the offst each dot based on the total number of dots
class Circle {
  int totalNumOfDots;
  double radius;

  Circle({required this.totalNumOfDots, required this.radius});

  Offset calcDotOffsetFromCenter(int dotNumber, double radius) {
    return Offset(_calcDotX(dotNumber), _calcDotY(dotNumber));
  }

  double _calcDotAngle(int currentDotNumber) {
    return -currentDotNumber * _calcRadiansPerDot();
  }

  double _calcRadiansPerDot() {
    return 2 * math.pi / (totalNumOfDots);
  }

  double _calcDotX(int thisDotNum) {
    //offset from indicator circles center
    return radius * math.sin(_calcDotAngle(thisDotNum));
  }

  double _calcDotY(int thisDotNum) {
    //offset from indicator circles center
    return radius * math.cos(_calcDotAngle(thisDotNum));
  }
}
 */

class AnimatedPageIndicatorFb1 extends StatelessWidget {
  const AnimatedPageIndicatorFb1(
      {super.key,
      required this.currentPage,
      required this.numPages,
      this.dotHeight = 10,
      this.activeDotHeight = 10,
      this.dotWidth = 10,
      this.activeDotWidth = 20,
      this.gradient =
          const LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)]),
      this.activeGradient = const LinearGradient(
          colors: [Color(0xff4338CA), Color(0xff6D28D9)])});

  final int
      currentPage; //the index of the active dot, i.e. the index of the page you're on
  final int
      numPages; //the total number of dots, i.e. the number of pages your displaying

  final double dotWidth; //the width of all non-active dots
  final double activeDotWidth; //the width of the active dot
  final double activeDotHeight; //the height of the active dot
  final double dotHeight; //the height of all dots
  final Gradient gradient; //the gradient of all non-active dots
  final Gradient activeGradient; //the gradient of the active dot

  double _calcRowSize() {
    //Calculates the size of the outer row that creates spacing that is equivalent to the width of a dot
    const int widthFactor = 2; //assuming spacing is equal to the width of a dot
    return (dotWidth * numPages * widthFactor) + activeDotWidth - dotWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _calcRowSize(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          numPages,
          (index) => _AnimatedPageIndicatorDot(
            isActive: currentPage == index,
            gradient: gradient,
            activeGradient: activeGradient,
            activeWidth: activeDotWidth,
            activeHeight: activeDotHeight,
          ),
        ),
      ),
    );
  }
}

class _AnimatedPageIndicatorDot extends StatelessWidget {
  const _AnimatedPageIndicatorDot({
    super.key,
    required this.isActive,
    this.height = 10,
    this.width = 10,
    this.activeWidth = 20,
    this.activeHeight = 10,
    required this.gradient,
    required this.activeGradient,
  });

  final bool isActive;
  final double height;
  final double width;
  final double activeWidth;
  final double activeHeight;
  final Gradient gradient;
  final Gradient activeGradient;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? activeWidth : width,
      height: isActive ? activeHeight : height,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          gradient: isActive ? activeGradient : gradient,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
    );
  }
}
