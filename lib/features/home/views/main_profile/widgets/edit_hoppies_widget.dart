import 'package:flutter/cupertino.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class EditHoppiesScreenWidget extends StatelessWidget {
  const EditHoppiesScreenWidget({
    super.key,
    required this.image,
    required this.text,
    this.selected = false,
  });

  final String image;
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: 1.aEdge,
        height: 44,
        width: 111,
        decoration: BoxDecoration(
          color: selected ? AppColors.whiteColor : AppColors.babyPinkColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: selected
                ? AppColors.pageControllerColor
                : AppColors.babyPinkColor,
          ),
        ),
        child: Row(
          children: [
            Image.asset(image.getPngAsset),
            const SizedBox(width: 4), // Add some spacing between widgets
            Expanded(
              child: TextWidget(
                text,
                overflow: TextOverflow.ellipsis, // Prevent text overflow
                maxLines: 1, // Restrict to a single line
              ),
            ),
          ],
        ),
      ),
    );
  }
}
