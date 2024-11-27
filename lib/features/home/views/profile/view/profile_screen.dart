import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/profile/widgets/hoppies_widget.dart';
import 'package:leqaa_app/features/home/views/profile/widgets/profile_main_info_widget.dart';
import 'package:leqaa_app/features/home/views/profile/widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    22.hSize,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            AppRoutes.pop(context);
                          },
                          child: Image.asset("next".getPngAsset),
                        ),
                        22.wSize,
                        const TextWidget.bigText("الملف الشخصي"),
                        99.wSize
                      ],
                    ),
                    22.hSize,
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.8,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: SizedBox(
                                width: 364,
                                child: Image.asset("profile_image".getPngAsset)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 73,
                              height: 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.whiteColor,
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.location_on_outlined,
                                      color: AppColors.pageControllerColor),
                                  TextWidget.mediumText("الكويت",
                                      color: AppColors.secondColor)
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  3,
                                      (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.bounceInOut,
                                    width: index == 1 ? 44 : 8,
                                    height: 8,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: index == 1
                                          ? AppColors.pageControllerColor
                                          : AppColors.pageControllerColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    12.hSize,
                    const ProfileWidget(),
                    const ProfileMainInfoWidget(),
                    const ProfileMainInfoWidget(),
                    const HoppiesWidget(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButtonWidget(
                        " مزيد من المعلومات حول سارة",
                        width: double.infinity,
                        color: AppColors.whiteColor,
                        backgroundColor: AppColors.secondColor,
                        onPressed: () {
                          // AppRoutes.routeTo(context, const MainNavigationScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                left: 99,
                right: 99,
                child: Container(
                  width: 190,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(555),
                    color: AppColors.whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('x3'.getPngAsset),
                      Image.asset('x2'.getPngAsset),
                      Image.asset('x'.getPngAsset),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

