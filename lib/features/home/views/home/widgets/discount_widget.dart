import 'package:flutter/cupertino.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 394,
      height: 109,
      decoration: BoxDecoration(
        color: AppColors.secondColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("discount".getPngAsset),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    TextWidget("احصل على  ", fontFamily: "Somar", fontSize: 12, color: AppColors.whiteColor),
                    TextWidget("خصم 20٪ ", color: AppColors.pageControllerColor, fontFamily: "Somar", fontSize: 19),
                    TextWidget(" على باقتنا الشهرية", fontFamily: "Somar", fontSize: 12, color: AppColors.whiteColor),
                  ],
                ),
                const TextWidget("الأولى!", fontFamily: "Somar", fontSize: 12, color: AppColors.whiteColor),
                9.hSize,
                const TextWidget("الاستمتاع بميزات حصرية مع باقاتنا المميزة.", fontFamily: "Somar", fontSize: 12, color: AppColors.whiteColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
