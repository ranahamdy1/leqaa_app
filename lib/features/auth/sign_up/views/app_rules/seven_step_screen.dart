import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/eight_step_screen.dart';
import 'package:leqaa_app/features/auth/sign_up/views/widgets/seven_screen_widget.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class SevenStepScreen extends StatelessWidget {
  final int currentStep;
  const SevenStepScreen({super.key, required this.currentStep});

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
                        height: 9,
                        child: LinearProgressBar(
                          maxSteps: 10,
                          currentStep: currentStep,
                          progressType: LinearProgressBar.progressTypeLinear,
                          dotsActiveSize: 55,
                          progressColor: AppColors.pageControllerColor,
                          backgroundColor: AppColors.pageControllerColorWithOpacity,
                          borderRadius: BorderRadius.circular(10), // NEW
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TextWidget("خطوة 10/7"),
              12.hSize,
              const TextWidget.bigText(" أضف صورك ( إختياري)"),
              12.hSize,
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset("add_image".getPngAsset),
                    ),
                    const SevenScreenWidget(),
                    const SevenScreenWidget(),
                    const SevenScreenWidget(),
                  ],
                ),
              ),
              44.hSize,
              CustomButtonWidget(
                "التالي",
                color: AppColors.whiteColor,
                backgroundColor: AppColors.mainColor,
                width: double.infinity,
                onPressed: (){
                  AppRoutes.routeTo(context, EightStepScreen(currentStep: currentStep + 1),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}