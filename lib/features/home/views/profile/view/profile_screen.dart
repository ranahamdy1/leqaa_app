import 'package:carousel_slider/carousel_slider.dart';
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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> urlImages = [
    "profile_image".getPngAsset,
    "profile_image".getPngAsset,
    "profile_image".getPngAsset,
  ];

  int _currentIndex = 0;

  // متغير لتتبع حالة العرض
  bool showMoreInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                          99.wSize,
                        ],
                      ),
                      22.hSize,
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.8,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SizedBox(
                                width: 444,
                                child: CarouselSlider.builder(
                                  itemCount: urlImages.length,
                                  itemBuilder: (BuildContext context, int index, int pageViewIndex) {
                                    final urlImage = urlImages[index];
                                    return buildImage(urlImage);
                                  },
                                  options: CarouselOptions(
                                    height: 400,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                width: 73,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.whiteColor,
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.location_on_outlined, color: AppColors.pageControllerColor),
                                    TextWidget.mediumText("الكويت", color: AppColors.secondColor),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                    urlImages.length,
                                        (index) => AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.bounceInOut,
                                      width: index == _currentIndex ? 44 : 8,
                                      height: 8,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: index == _currentIndex
                                            ? AppColors.pageControllerColor
                                            : AppColors.pageControllerColorWithOpacity,
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
                      // عرض الويدجيتين فقط إذا كان showMoreInfo = true
                      if (showMoreInfo) ...[
                        const ProfileMainInfoWidget(),
                        const HoppiesWidget(),
                      ],
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButtonWidget(
                          " مزيد من المعلومات حول سارة",
                          width: double.infinity,
                          color: AppColors.whiteColor,
                          backgroundColor: AppColors.secondColor,
                          borderColor: AppColors.secondColor,
                          onPressed: () {
                            setState(() {
                              showMoreInfo = !showMoreInfo;  // تغيير الحالة لإظهار/إخفاء الويدجيتين
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Positioned(
            bottom: 9,
            left: 99,
            right: 99,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(555),
                color: AppColors.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      //AppRoutes.routeTo(context, const ProfileTwoScreen());
                    },
                    child: Image.asset('x3'.getPngAsset),
                  ),
                  InkWell(
                    onTap: () {
                      //AppRoutes.routeTo(context, const ProfileThreeScreen());
                    },
                    child: Image.asset('x2'.getPngAsset),
                  ),
                  InkWell(
                      onTap: () {
                        AppRoutes.pop(context);
                      },
                      child: Image.asset('x'.getPngAsset)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Image.asset(urlImage, fit: BoxFit.cover),
  );
}
