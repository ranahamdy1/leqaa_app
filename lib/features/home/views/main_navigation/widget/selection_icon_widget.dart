import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class SelectionIconWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String imageText;
  const SelectionIconWidget({super.key, required this.onPressed, required this.text, required this.imageText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 44,
        width: 111,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            color: AppColors.whiteColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imageText.getPngAsset),
            TextWidget(text,color: AppColors.secondColor,fontSize: 12,),
          ],
        ),
      ),
    );
  }
}
