import 'package:pocket_pay_wallet/utils/constants/colors.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class BtnGradient extends StatelessWidget {
  double? height;
  double? width;
  Widget? child;
  double? cornerRadius;
  List<Color>? colors;
  BtnGradient(
      {Key? key,
      this.height,
      this.width,
      this.child,
      this.cornerRadius,
      this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          colors: colors ?? [AppColors.colorAccent, AppColors.colorAccentLight],
        ),
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: cornerRadius ?? 10,
            cornerSmoothing: 0.5,
          ),
        ),
      ),
      child: child ?? Container(),
    );
  }
}
