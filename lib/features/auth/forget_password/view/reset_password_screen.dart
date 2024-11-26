import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/main_navigation/main_navigation_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
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
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined,color: AppColors.mainColor,),
                ),
                12.hSize,
                CustomTextFormField(
                  hintText: 'اعادة ادخال كلمة المرور',
                  labelText: 'اعادة ادخال كلمة المرور',
                  kbType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  onChanged: (value) {  },
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined,color: AppColors.mainColor,),
                ),
                66.hSize,
                CustomButtonWidget(
                    "تأكيد",
                    width: double.infinity,
                    color: AppColors.whiteColor,
                    backgroundColor: AppColors.mainColor,
                    onPressed: (){
                      AppRoutes.routeTo(context, const MainNavigationScreen());
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
