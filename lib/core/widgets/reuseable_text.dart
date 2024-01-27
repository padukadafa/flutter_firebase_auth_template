import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_template/core/values/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
Widget ReuseableText(
  String text, {
  Color color = AppColors.black,
  double? fontSize,
  TextAlign? textAlign,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextDecoration? textDecoration,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.lato(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: textDecoration,
      decorationColor: color,
    ),
  );
}
