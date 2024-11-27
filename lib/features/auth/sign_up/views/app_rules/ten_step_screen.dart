import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/main_navigation/main_navigation_screen.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class TenStepScreen extends StatelessWidget {
  const TenStepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: 18.aEdge,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset("next".getPngAsset),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: SizedBox(
                          height: 9,
                          child: LinearProgressBar(
                            maxSteps: 10,
                            currentStep: 10,
                            progressType: LinearProgressBar.progressTypeLinear,
                            dotsActiveSize: 55,
                            progressColor: AppColors.pageControllerColor,
                            backgroundColor: AppColors.pageControllerColorWithOpacity,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const TextWidget("خطوة 10/10"),
                12.hSize,
                const TextWidget.bigText("عظيم!"),
                12.hSize,
                Image.asset("great".getPngAsset),
                12.hSize,
                const TextWidget("لقد تم إنشاء حسابك الشخصي بنجاح"),
                44.hSize,
                CustomButtonWidget(
                  "التالي",
                  color: AppColors.whiteColor,
                  backgroundColor: AppColors.mainColor,
                  width: double.infinity,
                  onPressed: () {
                    AppRoutes.routeTo(context, const MainNavigationScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
