import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/ten_step_screen.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:pinput/pinput.dart';

class NineStepScreen extends StatelessWidget {
  final int currentStep;
  NineStepScreen({super.key, required this.currentStep});
  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.smallTextColor),
      borderRadius: BorderRadius.circular(5),
    ),
  );

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
              const TextWidget("خطوة 10/9"),
              12.hSize,
              const TextWidget.bigText("لقد انتهيت تقريبا"),
              12.hSize,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget("تم ارسال بريد الكتروني إلى"),
                  TextWidget(" Mohamedali@gmail.com ",color: AppColors.secondColor,)
                ],
              ),
              const TextWidget("يحتوي على كود تفعيل التحقق"),
              12.hSize,
              Image.asset("great".getPngAsset),
              12.hSize,
              Form(
                key: formKey,
                child: Pinput(
                    controller: codeController,
                    length: 5,
                    obscuringCharacter: '•',
                    defaultPinTheme: defaultPinTheme,
                    autofocus: true,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration?.copyWith(
                        border: Border.all(
                          color: AppColors.secondColor,
                          width: 2,
                        ),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration?.copyWith(
                        color: const Color.fromRGBO(234, 239, 243, 1),
                      ),
                    ),
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) {
                      print(pin);
                    }),
              ),
              44.hSize,
              CustomButtonWidget(
                "التالي",
                color: AppColors.whiteColor,
                backgroundColor: AppColors.mainColor,
                width: double.infinity,
                onPressed: () {
                  AppRoutes.routeTo(context, const TenStepScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
