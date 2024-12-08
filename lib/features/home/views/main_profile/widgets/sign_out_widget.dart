import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class SignOutWidget extends StatelessWidget {
  const SignOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      contentPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("sign_out".getPngAsset),
                const TextWidget.bigText("تسجيل خروج"),
                const TextWidget.smallText(" هل تريد بالفعل تسجيل الخروج من التطبيق"),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        CustomButtonWidget(
          "نعم",
          color: AppColors.whiteColor,
          backgroundColor: AppColors.pageControllerColor,
          borderColor: AppColors.pageControllerColor,
          width: 122,
          onPressed: () {
            AppRoutes.pop(context);
          },
        ),
        9.wSize,
        CustomButtonWidget(
          "إلغاء",
          color: AppColors.whiteColor,
          backgroundColor: AppColors.secondColor,
          borderColor: AppColors.secondColor,
          width: 122,
          onPressed: () {
            AppRoutes.pop(context);
          },
        ),
      ],
      // Add the X icon button
      titlePadding: const EdgeInsets.only(right: 10, top: 10),
      title: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
