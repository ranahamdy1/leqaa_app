import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/chat_body_screen.dart';
import 'package:leqaa_app/features/home/views/chat/widgets/online_widget.dart';

class ChatColumContainerWidget extends StatelessWidget {
  const ChatColumContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: 2.0.w,right: 2.0,bottom: 2.0),
      child: InkWell(
        onTap: () {
          AppRoutes.routeTo(context, ChatBodyScreen());
        },
        child: Column(
          children: [
            Container(
              height: 55.h,
              width: screenWidth * 1.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Image.asset("chat_container".getPngAsset),
                      const Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: OnlineWidget(),
                      ),
                    ],
                  ),
                  9.wSize,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TextWidget.mediumText("أمال عبدالرحمن"),
                          155.wSize,
                          const TextWidget("3:00 PM", color: Colors.red)
                        ],
                      ),
                      const TextWidget.smallText(" مرحبا كيف حالك"),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.babyGreyColor),
          ],
        ),
      ),
    );
  }
}
