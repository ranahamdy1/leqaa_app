import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/app_rules_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthDayController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                  suffixIcon: const Icon(Icons.date_range_outlined,color: AppColors.mainColor,),
                ),
                12.hSize,
                CustomTextFormField(
                  hintText: 'كلمة المرور',
                  labelText: 'كلمة المرور',
                  kbType: TextInputType.visiblePassword,
                  controller: passwordController,
                  onChanged: (value) {  },
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined,color: AppColors.mainColor,),
                ),
                12.hSize,
                CustomTextFormField(
                  hintText: 'تأكيد كلمة المرور',
                  labelText: 'تأكيد كلمة المرور',
                  kbType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  onChanged: (value) {  },
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined,color: AppColors.mainColor,),
                ),
                22.hSize,
                Row(
                  children: [
                    Image.asset("check".getPngAsset),
                    9.wSize,
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
                  onPressed: (){
                    AppRoutes.routeTo(context, const AppRulesScreen());
                }
                ),
                12.hSize,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(" لدي حساب بالفعل ",fontFamily: 'Somar',),
                    TextWidget(" تسجيل دخول",color: AppColors.secondColor,fontFamily: "Somar",),
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
