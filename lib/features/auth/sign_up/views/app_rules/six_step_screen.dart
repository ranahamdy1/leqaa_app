import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/seven_step_screen.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class SixStepScreen extends StatelessWidget {
  final int currentStep;
  SixStepScreen({super.key, required this.currentStep});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: 12.aEdge,
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
                const TextWidget("خطوة 10/6"),
                12.hSize,
                const TextWidget.bigText("الشخصية"),
                12.hSize,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget.smallText("برجاء عمل اختبار الشخصية من خلال الرابط التالي"),
                    TextWidget("16personalities",color: AppColors.secondColor,),
                  ],
                ),
                22.hSize,
                CustomTextFormField(
                  hintText: "EFPI",
                  controller: controller,
                  kbType: TextInputType.visiblePassword,
                  onChanged: (value) {  },
                ),
                TextFormField(
                  maxLines: null,
                  minLines: 5,
                  decoration: InputDecoration(
                    hintText: 'مواصفاتك',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.babyGreyColor, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.babyGreyColor),
                    ),
                  ),
                ),
                12.hSize,
                TextFormField(
                  maxLines: null,
                  minLines: 5,
                  decoration: InputDecoration(
                    hintText: 'مواصفات شريك حياتك',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.babyGreyColor, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.babyGreyColor),
                    ),
                  ),
                ),
                66.hSize,
                CustomButtonWidget(
                  "التالي",
                  color: AppColors.whiteColor,
                  backgroundColor: AppColors.mainColor,
                  borderColor: AppColors.mainColor,
                  width: double.infinity,
                  onPressed: (){
                    AppRoutes.routeTo(context, SevenStepScreen(currentStep: currentStep + 1),);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
