import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/widgets/chat_colum_container_widget.dart';
import 'package:leqaa_app/features/home/views/chat/widgets/chat_row_container_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/search_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                33.hSize,
                Row(
                  children: [
                    const Spacer(),
                    const TextWidget("الدردشة"),
                    const Spacer(),
                    Image.asset("ring".getPngAsset),
                  ],
                ),
                18.hSize,
                const SearchWidget(),
                18.hSize,
                SizedBox(
                  height: screenHeight * 0.15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return const ChatRowContainerWidget();
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.7,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return const ChatColumContainerWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
