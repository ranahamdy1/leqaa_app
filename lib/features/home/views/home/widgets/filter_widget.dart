import 'package:flutter/cupertino.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.text, this.selected = false});
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        height: 44,
        width: 99,
        decoration: BoxDecoration(
            color: selected ? AppColors.secondColor : AppColors.pageControllerColorWithOpacity,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: selected ? AppColors.secondColor : AppColors.pageControllerColorWithOpacity,)
        ),
        child: Center(child: TextWidget(text,color: AppColors.whiteColor,)),
      ),
    );
  }

}