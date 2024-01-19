import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

TextStyle _getTextStyle({
  required FontWeight fontWeight,
  required Color color,
  double? fontSize,
}) {
  return TextStyle(
    color: color,
    fontFamily: "Somar",
    fontWeight: fontWeight,
    fontSize: (fontSize ?? 18).sp,
  );
/*   return GoogleFonts.almarai(
    color: color,
    fontWeight: fontWeight,
    fontSize: 14,
  ); */
}

// regular style
TextStyle getRegularStyle({
  required Color color,
  double? fontSize,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

// bold style
TextStyle getBoldStyle({
  required Color color,
  double? fontSize,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    color: color,
  );
}
