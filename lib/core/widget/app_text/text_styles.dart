import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../consts/app_colors.dart';
import 'dart:ui';

/* TextStyle _style({
  double? letterSpacing,
  double size = 14,
  double? hei,
  TextDecoration? decoration,
  Color? color = KColors.textColor,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      fontSize: size.sp,
      fontWeight: fontWeight ?? FontWeight.w400,
      // height: (hei ?? 1.2).h,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily ?? "NotoSans",
    );
 */

TextStyle gStyle24({
  double? letterSpacing,
  double? hei,
  TextDecoration? decoration,
  Color color = KColors.textColor,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      fSize: 24,
      fontWeight: fontWeight,
      height: hei,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle gStyle20({
  double? letterSpacing,
  double? hei,
  TextDecoration? decoration,
  Color color = KColors.primaryDark,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      fSize: 20,
      fontWeight: fontWeight,
      height: hei,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle gStyle18({
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
  Color color = KColors.primaryDark,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      fSize: 18,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle gStyle16({
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
  Color color = KColors.primaryDark,
  String? fontFamily,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      fSize: 16,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle gStyle14({
  double? letterSpacing,
  double? height,
  String? fontFamily,
  TextDecoration? decoration,
  Color color = KColors.primaryDark,
  double? wordSpacing,
  double fontSize = 14,
  FontWeight? fontWeight,
}) =>
    _style(
      fSize: fontSize,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      height: height,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle gStyle12({
  double? letterSpacing,
  double? hei,
  String? fontFamily,
  TextDecoration? decoration,
  Color? color,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      fSize: 12,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      height: hei,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle gStyle10({
  double? letterSpacing,
  double? height,
  String? fontFamily,
  TextDecoration? decoration,
  Color color = KColors.textGray,
  double? wordSpacing,
  FontWeight? fontWeight,
}) =>
    _style(
      fSize: 10,
      letterSpacing: letterSpacing,
      decoration: decoration,
      fontWeight: fontWeight,
      height: height,
      color: color,
      wordSpacing: wordSpacing,
      fontFamily: fontFamily,
    );

TextStyle _style({
  String? fontFamily = "NotoSans",
  Color? color = KColors.textColor,
  Color? backgroundColor,
  double fSize = 14,
  FontWeight? fontWeight = FontWeight.w400,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
}) {
  try {
    return TextStyle(
      fontFamily: fontFamily,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fSize.sp,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  } catch (ex) {
    return TextStyle(
      fontFamily: "NotoSans",
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fSize.sp,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}
