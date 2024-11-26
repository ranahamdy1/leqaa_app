import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/third_step_screen.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class SecondStepScreen extends StatelessWidget {
  final int currentStep;
  SecondStepScreen({super.key, required this.currentStep});

  final controller = TextEditingController();

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
                          currentStep: currentStep, // Use passed current step
                          progressColor: AppColors.pageControllerColor,
                          backgroundColor: AppColors.smallTextColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TextWidget("خطوة 10/2"),
              12.hSize,
              const TextWidget.bigText("المعلومات الاساسية والاجتماعية"),
              22.hSize,
              CustomTextFormField(
                hintText: "القيبلة / العائلة",
                labelText: "القيبلة / العائلة",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {},
              ),
              CustomTextFormField(
                hintText: "النسب",
                labelText: "النسب",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {},
                suffixIcon: const Icon(Icons.arrow_drop_down, size: 44),
              ),
              CustomTextFormField(
                hintText: "الجنسية",
                labelText: "الجنسية",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {},
                suffixIcon: const Icon(Icons.arrow_drop_down, size: 44),
              ),
              CustomTextFormField(
                hintText: "الحالة الاجتماعية",
                labelText: "الحالة الاجتماعية",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {},
                suffixIcon: const Icon(Icons.arrow_drop_down, size: 44),
              ),
              CustomTextFormField(
                hintText: "مكان الاقامة",
                labelText: "مكان الاقامة",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {},
                suffixIcon: const Icon(Icons.arrow_drop_down, size: 44),
              ),
              66.hSize,
              CustomButtonWidget(
                "التالي",
                color: AppColors.whiteColor,
                backgroundColor: AppColors.mainColor,
                width: double.infinity,
                onPressed: () {
                  AppRoutes.routeTo(context, ThirdStepScreen(currentStep: currentStep + 1),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
