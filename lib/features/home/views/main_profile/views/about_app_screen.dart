import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            66.hSize,
            Row(
              children: [
                InkWell(
                    onTap: (){
                      AppRoutes.pop(context);
                    },
                    child: Image.asset("next".getPngAsset)),
                const Spacer(),
                const TextWidget.bigText("عن التطبيق"),
                const Spacer(),
              ],
            ),
            22.hSize,
            Container(
                width: 400,
                height: 399,
                padding: 12.aEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset("splash_dark".getPngAsset),
                    12.hSize,
                    const TextWidget.bigText("حول التطبيق",color: AppColors.secondColor,),
                    22.hSize,
                    const TextWidget.smallText("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحةهذا النص هو مثال لنص يمكن أن يستبدل هذا النص هو مثال لنص  هذا النص هو هذا  هو مثال لنص يمكن أن يستبدل في نفس المساحةهذا النص هو مثال لنص يمكن أن يستبدل هذا النص هو مثال لنص  هذا النص هو هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحةهذا النص هو مثال لنص يمكن أن يستبدل هذا النص هو مثال لنص  هذا النص هو هذا هو مثال لنص يمكن أن يستبدل في نفس المساحةهذا النص هو مثال لنص يمكن أن يستبدل هذا النص هو مثال لنص  هذا النص هو هذا النص هو مثال لنص يمكن أن يستبدل في نفس ",),
                  ],
                ),
            ),
            22.hSize,
            const TextWidget.mediumText("صنع بكل حب ❤ في معامل جدارة")
          ],
        ),
      ),
    );
  }
}
