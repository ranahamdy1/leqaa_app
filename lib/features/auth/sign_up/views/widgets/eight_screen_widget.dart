import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class EightScreenWidget extends StatelessWidget {
  const EightScreenWidget({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 44,
        width: 103,
        decoration: BoxDecoration(
          color: AppColors.secondColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Image.asset(image.getPngAsset),
            TextWidget(text),
          ],
        ),
      ),
    );
  }
}
