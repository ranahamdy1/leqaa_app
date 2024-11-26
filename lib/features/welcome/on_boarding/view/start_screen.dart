import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/login/views/login_screen.dart';
import 'package:leqaa_app/features/auth/sign_up/views/sign_up/sign_up_screen.dart';
import 'package:leqaa_app/features/welcome/on_boarding/view/widgets/drawer_widget.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              44.hSize,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Image.asset("right_image".getPngAsset),
                  ),
                  InkWell(
                    onTap: () {
                      if(context.locale == const Locale('en')){
                        context.setLocale(const Locale("ar"));
                      }else{
                        context.setLocale(const Locale("en"));
                      }
                    },
                    child: Image.asset("left_image".getPngAsset),
                  ),
                ],
              ),
              44.hSize,
              Image.asset("start".getPngAsset),
              44.hSize,
              TextWidget.bigText("startScreenBigText".tr()),
              44.hSize,
              TextWidget.smallText("startScreenSmallTextOne".tr()),
              TextWidget.smallText("startScreenSmallTextTwo".tr()),
              122.hSize,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                    "login".tr(),
                    color: AppColors.whiteColor,
                    backgroundColor: AppColors.mainColor,
                    width: 170,
                    onPressed: () {
                      AppRoutes.routeTo(context, LoginScreen());
                    },
                  ),
                  12.wSize,
                  CustomButtonWidget(
                    "signUp".tr(),
                    color: AppColors.whiteColor,
                    backgroundColor: AppColors.secondColor,
                    width: 170,
                    onPressed: () {
                      AppRoutes.routeTo(context, SignUpScreen());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: SizedBox(
        width: 270,
        child: Drawer(
          backgroundColor: AppColors.whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                33.hSize,
                const DrawerWidget(
                  text: 'عن التطبيق',
                  image: 'about',
                ),
                20.hSize,
                const DrawerWidget(
                  text: 'المميزات',
                  image: 'about',
                ),
                20.hSize,
                const DrawerWidget(
                  text: 'طريقة الاشتراك ',
                  image: 'about',
                ),
                20.hSize,
                const DrawerWidget(
                  text: ' الشروط والاحكام',
                  image: 'about',
                ),
                20.hSize,
                const DrawerWidget(
                  text: 'الاسئلة الشائعة ',
                  image: 'about',
                ),
                20.hSize,
                const DrawerWidget(
                  text: 'الإتصال بنا ',
                  image: 'about',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
