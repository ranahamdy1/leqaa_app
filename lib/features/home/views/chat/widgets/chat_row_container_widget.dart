import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/widgets/online_widget.dart';

class ChatRowContainerWidget extends StatelessWidget {
  const ChatRowContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Column(
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
              const TextWidget("سارة"),
            ],
          ),
        ],
      ),
    );
  }
}
