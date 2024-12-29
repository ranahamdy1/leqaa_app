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
import 'package:leqaa_app/features/auth/login/views/login_screen.dart';
import 'package:leqaa_app/features/auth/sign_up/controller/sign_up/sign_up_cubit.dart';
import 'package:leqaa_app/features/auth/sign_up/controller/sign_up/sign_up_state.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/app_rules/view/app_rules_screen.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/choose_your_type_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthDayController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? isChecked;  // Changed to int to represent 0 or 1
  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChooseYourTypeScreen()));
            });
          } else if (state is SignUpFailedState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.msg, style: const TextStyle(color: AppColors.whiteColor)),
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
                        const TextWidget.bigText('إنشاء حساب'),
                        22.hSize,
                        CustomTextFormField(
                          hintText: 'الاسم',
                          labelText: "الاسم",
                          kbType: TextInputType.text,
                          controller: nameController,
                          validator: AppValidator.nameValidate,
                          onChanged: (value) {},
                        ),
                        12.hSize,
                        CustomTextFormField(
                          hintText: 'البريد الالكتروني ',
                          labelText: "البريد الالكتروني ",
                          kbType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: AppValidator.emailValidate,
                          onChanged: (value) {},
                        ),
                        12.hSize,
                        CustomTextFormField(
                          hintText: 'تاريخ الميلاد',
                          labelText: "تاريخ الميلاد",
                          kbType: TextInputType.number,
                          controller: birthDayController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'تاريخ الميلاد مطلوب';
                            }
                            final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$'); // YYYY-MM-DD format
                            if (!dateRegex.hasMatch(value)) {
                              return 'تاريخ الميلاد غير صحيح';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.date_range_outlined, color: AppColors.mainColor),
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null) {
                                birthDayController.text =
                                "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                              }
                            },
                          ),
                        ),
                        12.hSize,
                        CustomTextFormField(
                          hintText: 'كلمة المرور',
                          labelText: 'كلمة المرور',
                          kbType: TextInputType.visiblePassword,
                          controller: passwordController,
                          isObscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'كلمة المرور مطلوبة';
                            }
                            if (value.length < 8) {
                              return 'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل';
                            }
                            if (!RegExp(r'\d').hasMatch(value)) {
                              return 'يجب أن تحتوي كلمة المرور على رقم';
                            }
                            if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
                              return 'يجب أن تحتوي كلمة المرور على حرف';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.remove_red_eye_outlined,
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
                        CustomTextFormField(
                          hintText: 'تأكيد كلمة المرور',
                          labelText: 'تأكيد كلمة المرور',
                          kbType: TextInputType.visiblePassword,
                          controller: confirmPasswordController,
                          isObscureText: _obscureText2,
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'تأكيد كلمة المرور مطلوب';
                            }
                            if (value != passwordController.text) {
                              return 'كلمة المرور غير متطابقة';
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText2 ? Icons.visibility_off : Icons.remove_red_eye_outlined,
                              color: AppColors.mainColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                          ),
                        ),
                        22.hSize,
                        Row(
                          children: [
                            isChecked == null || isChecked == 0
                                ? InkWell(
                              onTap: () {
                                setState(() {
                                  isChecked = 1;  // Set to 1 when checked
                                });
                              },
                              child: const Icon(Icons.check_box_outline_blank, color: AppColors.mainColor),
                            )
                                : InkWell(
                              onTap: () {
                                setState(() {
                                  isChecked = 0;  // Set to 0 when unchecked
                                });
                              },
                              child: const Icon(Icons.check_box, color: AppColors.mainColor),
                            ),
                            const TextWidget("لقد قرأت ", fontFamily: "Somar"),
                            InkWell(
                              onTap: () {
                                AppRoutes.routeTo(context, const AppRulesScreen());
                              },
                              child: const TextWidget(
                                "الشروط والاحكام",
                                color: AppColors.secondColor,
                                fontFamily: "Somar",
                              ),
                            ),
                            const TextWidget(" ووافقت عليها", fontFamily: "Somar"),
                          ],
                        ),
                        44.hSize,
                        CustomButtonWidget(
                          "التالي",
                          width: double.infinity,
                          color: AppColors.whiteColor,
                          backgroundColor: AppColors.mainColor,
                          borderColor: AppColors.mainColor,
                          onPressed: () {
                            if (isChecked == null || isChecked == 0) {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content: Text('يجب الموافقة على الشروط والأحكام'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SignUpCubit>(context).signUp(
                                email: emailController.text,
                                name: nameController.text,
                                birth_date: birthDayController.text,
                                password: passwordController.text,
                                password_confirmation: confirmPasswordController.text,
                                terms_conditions: isChecked.toString(),
                              );
                            }
                          },
                        ),
                        12.hSize,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextWidget(" لدي حساب بالفعل ", fontFamily: 'Somar'),
                            InkWell(
                              onTap: () {
                                AppRoutes.routeTo(context, const LoginScreen());
                              },
                              child: const TextWidget(
                                " تسجيل دخول",
                                color: AppColors.secondColor,
                                fontFamily: "Somar",
                              ),
                            ),
                          ],
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
