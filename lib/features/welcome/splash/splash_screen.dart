import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/features/welcome/on_boarding/view/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            22.hSize,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset("splash_top_png".getPngAsset),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: AnimatedSplashScreen(
                duration: 1500,
                splashIconSize: 200,
                splashTransition: SplashTransition.fadeTransition,
                animationDuration: const Duration(milliseconds: 1500),
                splash: Image.asset("splash_png".getPngAsset),
                nextScreen: const OnBoardingScreen(),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}