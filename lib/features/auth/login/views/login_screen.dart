import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined,color: AppColors.mainColor,),
                ),
                12.hSize,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget("هل نسيت كلمة المرور ؟",color: AppColors.secondColor,),
                  ],
                ),
                66.hSize,
                CustomButtonWidget(
                    "تسجيل دخول",
                    width: double.infinity,
                    color: AppColors.whiteColor,
                    backgroundColor: AppColors.mainColor,
                    onPressed: (){
                      //AppRoutes.routeTo(context, const AppRulesScreen());
                    }
                ),
                12.hSize,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(" ليس لديك حساب ",fontFamily: 'Somar',),
                    InkWell(
                        onTap: (){
                          AppRoutes.routeTo(context, SignUpScreen());
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
