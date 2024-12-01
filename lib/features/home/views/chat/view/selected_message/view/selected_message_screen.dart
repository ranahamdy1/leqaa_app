import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/widgets/bottom_sheet/chat_bottom_sheet_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/widgets/sound/view/sound_sample_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/widgets/text/chat_sample_widget.dart';

class SelectedMessageScreen extends StatelessWidget {
  const SelectedMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final ValueNotifier<bool> showScrollDownButton = ValueNotifier(false);

    // تأكد من أن التمرير يبدأ من الأسفل عند فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels <= scrollController.position.minScrollExtent) {showScrollDownButton.value = true;}
      else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {showScrollDownButton.value = true;}
      else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {showScrollDownButton.value = true;}
    });

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              22.hSize,
              Row(
                children: [
                  12.wSize,
                  Image.asset("next".getPngAsset),
                  2.wSize,
                  Image.asset("chat_container".getPngAsset),
                  8.wSize,
                  const TextWidget.bigText("أمال عبدالرحمن")
                ],
              ),
              const Divider(color: AppColors.babyGreyColor),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: const [
                    ChatSampleWidget(),
                    SoundSampleWidget(),
                    //FileSampleWidget(),
                    //EmptySampleWidget(),
                    //MissedCallWidget(),
                    //DeletedSampleWidget(),
                    SizedBox(height: 99),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: const ChatBottomSheetWidget(),
        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: showScrollDownButton,
          builder: (context, isVisible, child) {
            return isVisible
                ? FloatingActionButton(
              onPressed: () {
                // التمرير إلى نهاية القائمة
                scrollController.jumpTo(scrollController.position.maxScrollExtent);
                // إخفاء الزر بعد الضغط
                showScrollDownButton.value = false;
              },
              backgroundColor: AppColors.secondColor,
              shape: const CircleBorder(),
              elevation: 5.0,
              child: const Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Icon(
                    Icons.arrow_downward,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
