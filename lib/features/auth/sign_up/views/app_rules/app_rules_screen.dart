import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/choose_your_type_screen.dart';

class AppRulesScreen extends StatelessWidget {
  const AppRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: 8.aEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              22.hSize,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("splash_dark".getPngAsset),
                ],
              ),
              22.hSize,
              const TextWidget.bigText("شروط وأحكام تطبيق لقاء"),
              6.hSize,
              const TextWidget.smallText("باستخدام التطبيق الخاص بنا ، فإنك توافق على الامتثال للبنود "),
              const TextWidget.smallText("والشروط التالية والالتزام بها يرجى مراجعتها بعناية."),
              11.hSize,
              const Row(
                children: [
                  TextWidget("1- ",color: AppColors.pageControllerColor,),
                  TextWidget.mediumText("يجب أن يكون عمرك 18 عامًا على الأقل لاستخدام هذا التطبيق. "),
                ],
              ),
              const TextWidget.mediumText("باستخدام التطبيق ، فإنك تقر وتضمن أن لديك الحق والسلطة والقدرة"),
              const TextWidget.mediumText("على الدخول في هذه الاتفاقية والالتزام بجميع البنود والشروط"),
              11.hSize,
              const Row(
                children: [
                  TextWidget("2- ",color: AppColors.pageControllerColor,),
                  TextWidget.mediumText("يجب أن يكون عمرك 18 عامًا على الأقل لاستخدام هذا التطبيق. "),
                ],
              ),
              const TextWidget.mediumText("باستخدام التطبيق ، فإنك تقر وتضمن أن لديك الحق والسلطة والقدرة"),
              11.hSize,
              const Row(
                children: [
                  TextWidget("3- ",color: AppColors.pageControllerColor,),
                  TextWidget.mediumText("يجب أن يكون عمرك 18 عامًا على الأقل لاستخدام هذا التطبيق. "),
                ],
              ),
              const TextWidget.mediumText("باستخدام التطبيق ، فإنك تقر وتضمن أن لديك الحق والسلطة والقدرة"),
              155.hSize,
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtonWidget(
                      "موافق",
                      color: AppColors.whiteColor,
                      backgroundColor: AppColors.mainColor,
                      borderColor: AppColors.mainColor,
                      width: 144,
                      onPressed: (){
                        AppRoutes.routeTo(context, const ChooseYourTypeScreen());
                      },
                    ),
                    CustomButtonWidget(
                      "إلغاء",
                      color: AppColors.whiteColor,
                      backgroundColor: AppColors.secondColor,
                      borderColor: AppColors.secondColor,
                      width: 144,
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
