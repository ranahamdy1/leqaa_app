import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/forget_password/view/reset_password_screen.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});

  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: AppColors.mainColor,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.smallTextColor),
      borderRadius: BorderRadius.circular(5),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: 26.aEdge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                22.hSize,
                Image.asset("splash_dark".getPngAsset),
                33.hSize,
                const TextWidget.bigText('نسيت كلمة المرور'),
                12.hSize,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget.smallText("تحقق من بريدك الالكتروني وادخل رمز التحقق لتغيير كلمة المرور "),
                  ],
                ),
                22.hSize,
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
                          color: AppColors.babyPinkColor,
                        ),
                      ),
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) {
                        print(pin);
                      }),
                ),
                66.hSize,
                CustomButtonWidget(
                    " تأكيد",
                    width: double.infinity,
                    color: AppColors.whiteColor,
                    backgroundColor: AppColors.mainColor,
                    borderColor: AppColors.mainColor,
                    onPressed: (){
                      AppRoutes.routeTo(context, ResetPasswordScreen());
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
