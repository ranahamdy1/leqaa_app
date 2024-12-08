import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/widgets/online_widget.dart';

class ChatRowContainerWidget extends StatelessWidget {
  const ChatRowContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0.w),
      child: Row(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "chat_container".getPngAsset,
                    width: 48.w,
                    height: 48.h,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: OnlineWidget(),
                  ),
                ],
              ),
              4.hSize,
              TextWidget("سارة", fontSize: 14.sp),
            ],
          ),
        ],
      ),
    );
  }
}
