import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/home/view/notification_screen.dart';
import 'package:leqaa_app/features/home/views/home/widgets/discount_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/home_container_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/home_container_widget_two.dart';
import 'package:leqaa_app/features/home/views/home/widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 22.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget.bigText("مرحبا محمد"),
                        SizedBox(height: 9.h),
                        TextWidget.mediumText(
                          "startScreenBigText".tr(),
                          color: AppColors.pageControllerColor,
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: (){
                          AppRoutes.routeTo(context, const NotificationScreen());
                        },
                        child: Image.asset("notification".getPngAsset)),
                  ],
                ),
                SizedBox(height: 12.h),
                const SearchWidget(),
                SizedBox(height: 12.h),
                const DiscountWidget(),
                SizedBox(height: 12.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget("الأكثر توافق"),
                    TextWidget("عرض المزيد", color: AppColors.pageControllerColor),
                  ],
                ),
                SizedBox(height: 12.h),
                const HomeContainerWidget(),
                /*SizedBox(
                  height: 444.h,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const HomeContainerWidget();
                    },
                  ),
                ),*/
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget("متوافقين"),
                    TextWidget("عرض المزيد", color: AppColors.pageControllerColor),
                  ],
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 300.h,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return const HomeContainerWidgetTwo();
                    },
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget("اقتراحات أخرى"),
                    TextWidget("عرض المزيد", color: AppColors.pageControllerColor),
                  ],
                ),
                SizedBox(height: 12.h),
                const HomeContainerWidgetTwo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
