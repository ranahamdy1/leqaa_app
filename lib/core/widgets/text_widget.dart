import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.color,
    this.overflow,
    this.textDirection,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.shadows,
    this.maxLines,
    this.fontFamily,
  });
  final String text;
  final Color? color;
  final TextOverflow? overflow;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final List<Shadow>? shadows;
  final int? maxLines;
  final String? fontFamily;

  const TextWidget.bigText(
    this.text, {
    super.key,
    this.color = AppColors.mainColor,
    this.overflow,
    this.textDirection,
    this.textAlign,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.shadows,
    this.maxLines,
    this.fontFamily = "Somar",
  });
  const TextWidget.smallText(
      this.text, {
        super.key,
        this.color = AppColors.smallTextColor,
        this.overflow,
        this.textDirection,
        this.textAlign,
        this.fontSize = 12,
        this.fontWeight = FontWeight.w400,
        this.shadows,
        this.maxLines,
        this.fontFamily = "Somar",
      });
  const TextWidget.mediumText(
      this.text, {
        super.key,
        this.color = AppColors.mainColor,
        this.overflow,
        this.textDirection,
        this.textAlign,
        this.fontSize = 12,
        this.fontWeight = FontWeight.w700,
        this.shadows,
        this.maxLines,
        this.fontFamily = "Somar",
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow ?? TextOverflow.ellipsis,
      textDirection: textDirection,
      textAlign: TextAlign.center,
      maxLines: 3,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadows,
        fontFamily: fontFamily
      ),
    );
  }
}
