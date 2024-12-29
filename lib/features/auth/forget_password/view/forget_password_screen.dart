import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/utils/app_validation.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/forget_password/controller/forget_password_cubit.dart';
import 'package:leqaa_app/features/auth/forget_password/controller/forget_password_state.dart';
import 'package:leqaa_app/features/auth/forget_password/view/verification_code_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AppRoutes.routeTo(context, VerificationCodeScreen());
            });
          } else if (state is ForgetPasswordFailedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.msg,
                    style: const TextStyle(color: AppColors.whiteColor)),
                backgroundColor: Colors.red,
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child:
                    const TextWidget('موافق', color: AppColors.whiteColor),
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
                  padding: 28.aEdge,
                  child: Form(
                    key: formKey,
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
                            TextWidget.smallText(
                                "يمكنك تغيير كلمة المرور من خلال البريد الالكتروني الخاص بك"),
                          ],
                        ),
                        22.hSize,
                        CustomTextFormField(
                          hintText: 'ahmedali@gmail.com',
                          labelText: "ahmedali@gmail.com ",
                          kbType: TextInputType.emailAddress,
                          controller: emailController,
                          onChanged: (value) {},
                          validator: AppValidator.emailValidate,
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
                                BlocProvider.of<ForgetPasswordCubit>(context).getForgetPassword(
                                  email: emailController.text,
                                );
                              }
                            }
                        ),
                      ],
                    ),
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
