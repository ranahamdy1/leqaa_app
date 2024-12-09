import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Container(
        padding: EdgeInsets.all(8.w),
        width: double.infinity,
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(color: AppColors.babyGreyColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 44.h,
              width: 32.w,
              child: Image.asset("waving".getPngAsset),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TextWidget.bigText(
                          "مرحبًا بك في لقاء",
                          fontSize: 14.sp
                        ),
                        const Spacer(),
                        TextWidget.smallText(
                          "منذ يومين",
                          color: AppColors.secondColor,
                          fontSize: 12.sp
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    TextWidget(
                      "هل أنت مستعد لمقابلة أشخاص جدد؟ لنبدأ!",
                      fontSize: 12.sp
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
