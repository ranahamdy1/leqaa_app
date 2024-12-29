import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/forget_password/controller/verify_password/verify_password_cubit.dart';
import 'package:leqaa_app/features/auth/forget_password/controller/verify_password/verify_password_state.dart';
import 'package:leqaa_app/features/auth/forget_password/view/reset_password_screen.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeScreen extends StatelessWidget {
  final TextEditingController emailController;
  VerificationCodeScreen({super.key, required this.emailController});

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
    return BlocProvider(
      create: (context) => VerifyPasswordCubit(),
      child: BlocConsumer<VerifyPasswordCubit, VerifyPasswordStates>(
        listener: (context, state) {
          if (state is VerifyPasswordSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AppRoutes.routeTo(context, ResetPasswordScreen(emailController: emailController,));
            });
          } else if (state is VerifyPasswordFailedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.msg,
                    style: const TextStyle(color: AppColors.whiteColor)),
                backgroundColor: Colors.red,
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const TextWidget('موافق', color: AppColors.whiteColor),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
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
                              debugPrint(pin);
                            }),
                      ),
                      66.hSize,
                      CustomButtonWidget(
                          " تأكيد",
                          width: double.infinity,
                          color: AppColors.whiteColor,
                          backgroundColor: AppColors.mainColor,
                          borderColor: AppColors.mainColor,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<VerifyPasswordCubit>(context).getVerifyPassword(
                                email: emailController.text,
                                code: codeController.text,
                              );
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
