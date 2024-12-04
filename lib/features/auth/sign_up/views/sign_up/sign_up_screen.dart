import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/login/views/login_screen.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/app_rules_screen.dart';

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
  bool isChecked = false;
  bool _obscureText = true;
  bool _obscureText2 = true;


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
                const TextWidget.bigText('إنشاء حساب'),
                22.hSize,
                CustomTextFormField(
                  hintText: 'االاسم',
                  labelText: "االاسم",
                  kbType: TextInputType.text,
                  controller: nameController,
                  onChanged: (value) {  },
                ),
                12.hSize,
                CustomTextFormField(
                  hintText: 'البريد الالكتروني ',
                  labelText: "البريد الالكتروني ",
                  kbType: TextInputType.emailAddress,
                  controller: emailController,
                  onChanged: (value) {  },
                ),
                12.hSize,
                CustomTextFormField(
                  hintText: 'تاريخ الميلاد',
                  labelText: "تاريخ الميلاد",
                  kbType: TextInputType.number,
                  controller: birthDayController,
                  onChanged: (value) {  },
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.date_range_outlined,
                      color: AppColors.mainColor,
                    ),
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
                  onChanged: (value) {  },
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
                  onChanged: (value) {  },
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
                    isChecked == false?
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      },
                    ):
                    Row(
                      children: [
                        22.wSize,
                        Image.asset("check".getPngAsset),
                        22.wSize
                      ],
                    ),
                    const TextWidget("لقد قرأت ",fontFamily: "Somar",),
                    const TextWidget("الشروط والاحكام",color: AppColors.secondColor,fontFamily: "Somar",),
                    const TextWidget(" ووافقت عليها",fontFamily: "Somar",),
                  ],
                ),
                44.hSize,
                CustomButtonWidget(
                  "التالي",
                  width: double.infinity,
                  color: AppColors.whiteColor,
                  backgroundColor: AppColors.mainColor,
                    borderColor: AppColors.mainColor,
                  onPressed: (){
                    AppRoutes.routeTo(context, const AppRulesScreen());
                }
                ),
                12.hSize,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(" لدي حساب بالفعل ",fontFamily: 'Somar',),
                    InkWell(
                        onTap: (){
                          AppRoutes.routeTo(context, LoginScreen());
                        },
                        child: const TextWidget(" تسجيل دخول",color: AppColors.secondColor,fontFamily: "Somar",)),
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
