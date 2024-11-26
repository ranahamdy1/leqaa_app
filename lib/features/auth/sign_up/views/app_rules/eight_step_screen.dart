import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/nine_step_screen.dart';
import 'package:leqaa_app/features/auth/sign_up/views/widgets/eight_screen_widget.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class EightStepScreen extends StatelessWidget {
  final int currentStep;
  const EightStepScreen({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: 18.aEdge,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset("next".getPngAsset),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: SizedBox(
                        height: 13,
                        child: LinearProgressBar(
                          maxSteps: 10,
                          currentStep: currentStep,
                          progressType: LinearProgressBar.progressTypeLinear,
                          dotsActiveSize: 55,
                          progressColor: AppColors.pageControllerColor,
                          backgroundColor: AppColors.smallTextColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TextWidget("خطوة 10/8"),
              12.hSize,
              const TextWidget.bigText("أضف هواياتك"),
              12.hSize,
              const Row(
                children: [
                  EightScreenWidget(image: 'movie', text: 'مشاهدة الافلام'),
                  EightScreenWidget(image: 'movie', text: 'مشاهدة الافلام'),
                  EightScreenWidget(image: 'movie', text: 'مشاهدة الافلام'),
                ],
              ),
              const Row(
                children: [
                  EightScreenWidget(image: 'movie', text: 'مشاهدة الافلام'),
                  EightScreenWidget(image: 'movie', text: 'مشاهدة الافلام'),
                  EightScreenWidget(image: 'movie', text: 'مشاهدة الافلام'),
                ],
              ),
              const Row(
                children: [
                  EightScreenWidget(image: 'movie', text: 'مشاهدة الافلام'),
                ],
              ),
              88.hSize,
              CustomButtonWidget(
                "التالي",
                color: AppColors.whiteColor,
                backgroundColor: AppColors.mainColor,
                width: double.infinity,
                onPressed: () {
                  AppRoutes.routeTo(context, NineStepScreen(currentStep: currentStep + 1),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
