import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import 'ctext.dart';

class CButton extends StatelessWidget {
  final String text;
  final Function()? onButtonPressed;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final List<Color>? btnColor;
  final Color? labelColor;
  final double? fontSize;
  final double? radius;

  const CButton(
      {super.key,
      required this.text,
      this.onButtonPressed,
      this.margin,
      this.height,
      this.width,
      this.btnColor,
      this.labelColor,
      this.fontSize,
      this.radius = 5});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        alignment: Alignment.center,
        margin: margin ??
            const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
        height: height ?? 50,
        width: width ?? 200,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors:
                btnColor ?? [AppColors.colorAccent, AppColors.colorAccentLight],
          ),
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 10,
              cornerSmoothing: 0.5,
            ),
          ),
        ),
        child: Center(
          child: FittedBox(
            child: CText(
              text: text,
              isTextOverflow: false,
              fontSize: fontSize ?? 20.0,
              color: labelColor ?? Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
