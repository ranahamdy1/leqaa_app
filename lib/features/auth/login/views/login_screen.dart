import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/forget_password/view/forget_password_screen.dart';
import 'package:leqaa_app/features/auth/sign_up/views/sign_up/sign_up_screen.dart';
import 'package:leqaa_app/features/home/views/main_navigation/main_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: 28.aEdge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                22.hSize,
                Image.asset("splash_dark".getPngAsset),
                33.hSize,
                const TextWidget.bigText('تسجيل الدخول'),
                22.hSize,
                CustomTextFormField(
                  hintText: 'البريد الالكتروني ',
                  labelText: "البريد الالكتروني ",
                  kbType: TextInputType.emailAddress,
                  controller: emailController,
                  onChanged: (value) {  },
                ),
                12.hSize,
                CustomTextFormField(
                  hintText: 'كلمة المرور',
                  labelText: 'كلمة المرور',
                  kbType: TextInputType.visiblePassword,
                  controller: passwordController,
                  onChanged: (value) {  },
                  isObscureText: _obscureText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.remove_red_eye_outlined,
                      color: AppColors.mainColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      }
                      );
                    },
                  ),
                ),
                12.hSize,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: (){
                          AppRoutes.routeTo(context, ForgetPasswordScreen());
                        },
                        child: const TextWidget("هل نسيت كلمة المرور ؟",color: AppColors.secondColor,)),
                  ],
                ),
                188.hSize,
                CustomButtonWidget(
                    "تسجيل دخول",
                    width: double.infinity,
                    color: AppColors.whiteColor,
                    backgroundColor: AppColors.mainColor,
                    onPressed: (){
                      AppRoutes.routeTo(context, const MainNavigationScreen());
                    }
                ),
                12.hSize,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(" ليس لديك حساب ",fontFamily: 'Somar',),
                    InkWell(
                        onTap: (){
                          AppRoutes.routeTo(context, const SignUpScreen());
                        },
                        child: const TextWidget(" سجل الان",color: AppColors.secondColor,fontFamily: "Somar",)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
