import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              44.hSize,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){},
                      child: Image.asset("left_image".getPngAsset)),
                  InkWell(
                    onTap: (){},
                      child: Image.asset("right_image".getPngAsset)),
                ],
              ),
              44.hSize,
              Image.asset("start".getPngAsset),
              44.hSize,
              const TextWidget.bigText("مرحبا بك فى لقاء "),
              44.hSize,
              const TextWidget.smallText("انضم إلينا للعثور على شريك حياتك المثالي وبدء رحلتك نحو زواج"),
              const TextWidget.smallText(" سعيد وناجح"),
              122.hSize,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomButtonWidget(
                    "تسجيل دخول",
                    color: AppColors.whiteColor,
                    backgroundColor: AppColors.secondColor,
                    width: 170,
                  ),
                  12.wSize,
                  const CustomButtonWidget("انشاء حساب",
                      color: AppColors.whiteColor,
                      backgroundColor: AppColors.mainColor,
                      width: 170
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
