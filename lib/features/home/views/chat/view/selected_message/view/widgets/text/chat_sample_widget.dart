import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';

class ChatSampleWidget extends StatelessWidget {
  const ChatSampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 166),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: ClipPath(
                    clipper: LowerNipMessageClipper(MessageType.receive),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: const BoxDecoration(
                        color: AppColors.pageControllerColorWithOpacity,
                      ),
                      child: const Text(
                        "مرحبا كيف حالك سارة ؟",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset("chat_container".getPngAsset),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 60), // Adjust padding
                child: ClipPath(
                  clipper: LowerNipMessageClipper(MessageType.send),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: const BoxDecoration(
                      color: AppColors.babyPinkColor,
                    ),
                    child: const Text(
                      "مرحبا كيف حالك سارة ؟",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.secondColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Row(
              children: [
                Text("13:00"),
                Icon(Icons.done_all_outlined,
                    color: AppColors.pageControllerColor
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
