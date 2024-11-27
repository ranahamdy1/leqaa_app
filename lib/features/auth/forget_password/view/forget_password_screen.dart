import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/forget_password/view/verification_code_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final controller = TextEditingController();

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
                const TextWidget.bigText('نسيت كلمة المرور'),
                12.hSize,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget.smallText("يمكنك تغيير كلمة المرور من خلال البريد الالكتروني الخاص بك"),
                  ],
                ),
                22.hSize,
                CustomTextFormField(
                  hintText: 'ahmedali@gmail.com',
                  labelText: "ahmedali@gmail.com ",
                  kbType: TextInputType.emailAddress,
                  controller: controller,
                  onChanged: (value) {  },
                ),
                66.hSize,
                CustomButtonWidget(
                    " تأكيد",
                    width: double.infinity,
                    color: AppColors.whiteColor,
                    backgroundColor: AppColors.mainColor,
                    onPressed: (){
                      AppRoutes.routeTo(context, VerificationCodeScreen());
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
