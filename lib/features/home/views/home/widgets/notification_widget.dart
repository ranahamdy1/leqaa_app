import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(8.w),
        width: 364,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(color: AppColors.babyGreyColor )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 44,
                width: 32,
                child: Image.asset("waving".getPngAsset)),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const TextWidget.bigText("مرحبًا بك في  لقاء"),
                      122.wSize,
                      const TextWidget.smallText("منذ يومين",color:AppColors.secondColor),
                    ],
                  ),
                  const TextWidget("هل أنت مستعد لمقابلة أشخاص جدد؟ لنبدأ!"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
