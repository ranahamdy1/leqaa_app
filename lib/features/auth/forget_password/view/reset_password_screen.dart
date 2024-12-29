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
import 'package:leqaa_app/features/auth/forget_password/controller/reset_password/reset_password_cubit.dart';
import 'package:leqaa_app/features/auth/forget_password/controller/reset_password/reset_password_state.dart';
import 'package:leqaa_app/features/home/views/main_navigation/main_navigation_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController;
  ResetPasswordScreen({super.key, required this.emailController});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ResetPasswordCubit(),
  child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
    listener: (context, state) {
      if (state is ResetPasswordSuccessState) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          AppRoutes.routeTo(context, const MainNavigationScreen());
        });
      } else if (state is ResetPasswordFailedState) {
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
            padding: 28.aEdge,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  22.hSize,
                  Image.asset("splash_dark".getPngAsset),
                  33.hSize,
                  const TextWidget.bigText('اعادة تعيين كلمة المرور'),
                  12.hSize,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget.mediumText("يرجي إضافة كلمة مرور جديدة للحفاظ على سرية بياناتك"),
                    ],
                  ),
                  22.hSize,
                  CustomTextFormField(
                    hintText: 'كلمة مرور جديدة',
                    labelText: "كلمة مرور جديدة",
                    kbType: TextInputType.visiblePassword,
                    controller: passwordController,
                    onChanged: (value) {  },
                    validator: AppValidator.passwordValidate,
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined,color: AppColors.mainColor,),
                  ),
                  12.hSize,
                  CustomTextFormField(
                    hintText: 'اعادة ادخال كلمة المرور',
                    labelText: 'اعادة ادخال كلمة المرور',
                    kbType: TextInputType.visiblePassword,
                    controller: confirmPasswordController,
                    validator: AppValidator.passwordValidate,
                    onChanged: (value) {  },
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined,color: AppColors.mainColor,),
                  ),
                  66.hSize,
                  CustomButtonWidget(
                      "تأكيد",
                      width: double.infinity,
                      color: AppColors.whiteColor,
                      backgroundColor: AppColors.mainColor,
                      borderColor: AppColors.mainColor,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<ResetPasswordCubit>(context).getResetPassword(
                            email: emailController.text,
                            password: passwordController.text,
                            password_confirmation: confirmPasswordController.text,
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
