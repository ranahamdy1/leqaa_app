import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class EightScreenWidget extends StatelessWidget {
  const EightScreenWidget({super.key, required this.image, required this.text, required this.isSelected});

  final String image;
  final String text;
  final bool isSelected; // Add this property to manage selection state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 44,
        width: 103,
        decoration: BoxDecoration(
          color: AppColors.babyPinkColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? AppColors.secondColor : AppColors.babyPinkColor, // Conditional border color
          ),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                  height: 36,
                  width: 36,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: TextWidget(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
