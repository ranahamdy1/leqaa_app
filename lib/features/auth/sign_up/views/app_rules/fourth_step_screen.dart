import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/fifth_step_screen.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class FourthStepScreen extends StatelessWidget {
  final int currentStep;
  FourthStepScreen({super.key, required this.currentStep});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const TextWidget("خطوة 10/4"),
                12.hSize,
                const TextWidget.bigText("الاهتمام بالدين"),
                22.hSize,
                CustomTextFormField(
                  hintText: "الالتزام الديني ",
                  labelText: "الالتزام الديني",
                  controller: controller,
                  kbType: TextInputType.visiblePassword,
                  onChanged: (value) {  },
                  suffixIcon: const Icon(Icons.arrow_drop_down,size: 44),
                ),
                CustomTextFormField(
                  hintText: "الاهتمام بالحجاب",
                  labelText: "الاهتمام بالحجاب",
                  controller: controller,
                  kbType: TextInputType.visiblePassword,
                  onChanged: (value) {  },
                  suffixIcon: const Icon(Icons.arrow_drop_down,size: 44),
                ),
                CustomTextFormField(
                  hintText: "هل انت مدخن",
                  labelText: "هل انت مدخن",
                  controller: controller,
                  kbType: TextInputType.visiblePassword,
                  onChanged: (value) {  },
                  suffixIcon: const Icon(Icons.arrow_drop_down,size: 44),
                ),
                66.hSize,
                CustomButtonWidget(
                  "التالي",
                  color: AppColors.whiteColor,
                  backgroundColor: AppColors.mainColor,
                  width: double.infinity,
                  onPressed: (){
                    AppRoutes.routeTo(context, FifthStepScreen(currentStep: currentStep + 1),);

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