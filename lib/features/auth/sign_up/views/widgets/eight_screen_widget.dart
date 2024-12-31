import 'package:flutter/material.dart';
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
          color: AppColors.babyPinkColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 2, // Adjust flex to control the image's space ratio
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  image,
                  fit: BoxFit.contain, // Prevents overflow by resizing the image
                  height: 36, // Ensures the image height fits the container
                  width: 36,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: TextWidget(
                text,
                overflow: TextOverflow.ellipsis, // Truncate text if it overflows
                maxLines: 1, // Ensures the text stays within one line
              ),
            ),
          ],
        ),
      ),
    );
  }
}
