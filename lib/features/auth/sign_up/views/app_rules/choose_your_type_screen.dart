import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/second_step_screen.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class ChooseYourTypeScreen extends StatefulWidget {
  const ChooseYourTypeScreen({super.key});

  @override
  State<ChooseYourTypeScreen> createState() => _ChooseYourTypeScreenState();
}

class _ChooseYourTypeScreenState extends State<ChooseYourTypeScreen> {
  int _currentStep = 1;

  void _incrementStep() {
    setState(() {
      if (_currentStep < 10) _currentStep++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                          currentStep: _currentStep,
                          progressColor: AppColors.pageControllerColor,
                          backgroundColor: AppColors.pageControllerColorWithOpacity,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TextWidget("خطوة 10/1"),
              33.hSize,
              const TextWidget.bigText("حدد النوع لانشاء ملفك الشخصي"),
              29.hSize,
              Image.asset("boy".getPngAsset),
              22.hSize,
              Image.asset("girl".getPngAsset),
              55.hSize,
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: CustomButtonWidget(
                  "التالي",
                  color: AppColors.whiteColor,
                  backgroundColor: AppColors.mainColor,
                  width: double.infinity,
                  onPressed: () {
                    _incrementStep();
                    AppRoutes.routeTo(context, SecondStepScreen(currentStep: _currentStep),);
                  }, // Pass current step to the next screen
                ),
              ),
              const TextWidget(
                "تسجيل دخول",
                color: AppColors.secondColor,
                fontFamily: "Somar",
              ),
              22.hSize,
            ],
          ),
        ),
      ),
    );
  }
}

