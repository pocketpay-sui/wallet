import 'package:flutter/material.dart';

import '../utils/constants/strings.dart';

class CText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final bool isTextOverflow;
  final TextAlign? textAlign;
  final String? isUnderLine;
  final int? maxLines;
  final String? fontName;
  final TextDecoration? textDecoration;

  const CText(
      {required this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.isTextOverflow = false,
      this.textAlign,
      this.isUnderLine,
      this.maxLines,
      this.fontName,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      overflow: isTextOverflow ? TextOverflow.ellipsis : null,
      style: TextStyle(
        fontFamily: fontName ?? Strings.fontFamilyName,
        color: color ?? Colors.white,
        fontWeight: fontWeight,
        fontSize: fontSize ?? 14.0,
        decoration:
            isUnderLine == '1' ? TextDecoration.underline : textDecoration,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
