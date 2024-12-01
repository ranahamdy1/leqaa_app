import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/selected_message_screen.dart';
import 'package:leqaa_app/features/home/views/chat/widgets/online_widget.dart';

class ChatColumContainerWidget extends StatelessWidget {
  const ChatColumContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){
          AppRoutes.routeTo(context, const SelectedMessageScreen());
        },
        child: Column(
          children: [
            Container(
              height: 55,
              width: 360,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: const Offset(0, 3),
                //   ),
                // ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
            ),
            const Divider(color: AppColors.babyGreyColor),
          ],
        ),
      ),
    );
  }
}
