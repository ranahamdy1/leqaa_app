import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/fourth_step_screen.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class ThirdStepScreen extends StatelessWidget {
  ThirdStepScreen({super.key});
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
                          maxSteps: 4,
                          progressType: LinearProgressBar.progressTypeLinear, // Use Linear progress
                          currentStep: 1,
                          dotsActiveSize: 55,
                          progressColor: AppColors.pageControllerColor,
                          backgroundColor: AppColors.smallTextColor,
                          borderRadius: BorderRadius.circular(10), // NEW
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TextWidget("خطوة 10/3"),
              12.hSize,
              const TextWidget.bigText("المظهر والصحة"),
              22.hSize,
              CustomTextFormField(
                hintText: "لون البشرة",
                labelText: "لون البشرة",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {  },
                suffixIcon: const Icon(Icons.arrow_drop_down,size: 44),
              ),
              CustomTextFormField(
                hintText: "الطول",
                labelText: "الطول",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {  },
              ),
              CustomTextFormField(
                hintText: "الوزن",
                labelText: "الوزن",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {  },
              ),
              CustomTextFormField(
                hintText: "بنية الجسم",
                labelText: "بنية الجسم",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {  },
                suffixIcon: const Icon(Icons.arrow_drop_down,size: 44),
              ),
              CustomTextFormField(
                hintText: "الحالة الصحية",
                labelText: "الحالة الصحية",
                controller: controller,
                kbType: TextInputType.visiblePassword,
                onChanged: (value) {  },
              ),
              66.hSize,
              CustomButtonWidget(
                "التالي",
                color: AppColors.whiteColor,
                backgroundColor: AppColors.mainColor,
                width: double.infinity,
                onPressed: (){
                  AppRoutes.routeTo(context, FourthStepScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
