import 'package:flutter/material.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(this.text, {super.key, this.onPressed, this.color, this.backgroundColor, this.width, required this.borderColor});
  final String text;
  final Color? color;
  final Color borderColor;
  final double? width;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: borderColor,
            ),
          ),
        ),
        child: TextWidget(
          text,
          color: color,
          fontFamily: "Somar",
        ),
      ),

    );
  }
}
