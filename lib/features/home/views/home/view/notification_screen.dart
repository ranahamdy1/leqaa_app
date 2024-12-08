import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            22.hSize,
            Row(
              children: [
                InkWell(
                    onTap: (){
                      AppRoutes.pop(context);
                    },
                    child: Image.asset("next".getPngAsset)),
                const Spacer(),
                const TextWidget.bigText("الاشعارات"),
                const Spacer(),
              ],
            ),
            12.hSize,
            const NotificationWidget(),
            const NotificationWidget(),
            const NotificationWidget(),
            const NotificationWidget(),
          ],
        ),
      ),
    );
  }
}
