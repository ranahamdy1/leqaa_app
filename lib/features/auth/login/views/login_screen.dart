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
import 'package:leqaa_app/features/auth/forget_password/view/forget_password_screen.dart';
import 'package:leqaa_app/features/auth/login/controller/login/login_cubit.dart';
import 'package:leqaa_app/features/auth/login/controller/login/login_state.dart';
import 'package:leqaa_app/features/auth/sign_up/views/sign_up/sign_up_screen.dart';
import 'package:leqaa_app/features/home/views/main_navigation/main_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AppRoutes.routeTo(context, const MainNavigationScreen());
            });
          } else if (state is LoginFailedState) {
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
                        const TextWidget.bigText('تسجيل الدخول'),
                        22.hSize,
                        CustomTextFormField(
                          hintText: 'البريد الالكتروني ',
                          labelText: "البريد الالكتروني ",
                          kbType: TextInputType.emailAddress,
                          controller: emailController,
                          onChanged: (value) {},
                          validator: AppValidator.emailValidate,
                        ),
                        12.hSize,
                        CustomTextFormField(
                          hintText: 'كلمة المرور',
                          labelText: 'كلمة المرور',
                          kbType: TextInputType.visiblePassword,
                          controller: passwordController,
                          onChanged: (value) {},
                          validator: AppValidator.passwordValidate,
                          isObscureText: _obscureText,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye_outlined,
                              color: AppColors.mainColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        12.hSize,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  AppRoutes.routeTo(
                                      context, ForgetPasswordScreen());
                                },
                                child: const TextWidget(
                                  "هل نسيت كلمة المرور ؟",
                                  color: AppColors.secondColor,
                                )),
                          ],
                        ),
                        188.hSize,
                        CustomButtonWidget("تسجيل دخول",
                            width: double.infinity,
                            color: AppColors.whiteColor,
                            backgroundColor: AppColors.mainColor,
                            borderColor: AppColors.mainColor, onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        }),
                        12.hSize,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextWidget(
                              " ليس لديك حساب ",
                              fontFamily: 'Somar',
                            ),
                            InkWell(
                                onTap: () {
                                  AppRoutes.routeTo(
                                      context, const SignUpScreen());
                                },
                                child: const TextWidget(
                                  " سجل الان",
                                  color: AppColors.secondColor,
                                  fontFamily: "Somar",
                                )),
                          ],
                        )
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
