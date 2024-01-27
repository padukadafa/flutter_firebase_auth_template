import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_template/core/values/app_colors.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_text.dart';

enum ReuseableButtonStyle { style1, style2 }

// ignore: non_constant_identifier_names
Widget ReuseableButton({
  required String text,
  void Function()? onTap,
  Color backgroundColor = AppColors.primary,
  Color textColor = AppColors.onPrimary,
  ReuseableButtonStyle style = ReuseableButtonStyle.style1,
  Widget? leading,
}) {
  if (style == ReuseableButtonStyle.style2) {
    return Container(
      width: 428,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: ReuseableText(
              text,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
  return Container(
    width: 428,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 4,
        ),
      ],
    ),
    margin: const EdgeInsets.symmetric(horizontal: 24),
    child: Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leading ?? const SizedBox(),
              SizedBox(
                width: leading != null ? 12 : 0,
              ),
              ReuseableText(
                text,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
