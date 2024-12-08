import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/profile/view/profile_screen.dart';

class HomeContainerWidget extends StatelessWidget {
  const HomeContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        width: 343.w,
        height: 122.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5.r,
              blurRadius: 7.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              height: 66.h,
              width: 66.h,
              child: Image.asset("home_image".getPngAsset),
            ),
            SizedBox(width: 9.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget.bigText("سارة عبد الرحمن , 24 سنة  "),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.secondColor,
                        size: 15,
                      ),
                      TextWidget(
                        "الكويت",
                        color: AppColors.secondColor,
                      ),
                    ],
                  ),
                  const TextWidget.smallText(
                    "يضم التطبيق أكثر من 800000 عضو من جميع أنحاء العالم العربي",
                    fontSize: 9,
                  ),
                  const TextWidget.smallText(
                    " دول الخليج وأوروبا وأمريكا الشمالية.",
                    fontSize: 9,
                  ),
                  SizedBox(height: 5.h), // Responsive vertical spacing
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          AppRoutes.routeTo(context, const ProfileScreen());
                        },
                        child: Container(
                          width: 99.w,
                          height: 33.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: AppColors.pageControllerColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.white,
                                size: 13,
                              ),
                              SizedBox(width: 3.w),
                              const TextWidget.smallText(
                                "مشاهدة  ملف سارة",
                                color: Colors.white,
                                fontSize: 9,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        width: 99.w,
                        height: 33.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: AppColors.secondColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.white,
                              size: 13,
                            ),
                            SizedBox(width: 3.w),
                            const TextWidget.smallText(
                              "مشاهدة  ملف سارة",
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
