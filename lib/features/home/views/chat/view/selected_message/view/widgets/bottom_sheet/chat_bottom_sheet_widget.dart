import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/widgets/sound/view/record_screen.dart';

class ChatBottomSheetWidget extends StatefulWidget {
  const ChatBottomSheetWidget({super.key});

  @override
  State<ChatBottomSheetWidget> createState() => _ChatBottomSheetWidgetState();
}

class _ChatBottomSheetWidgetState extends State<ChatBottomSheetWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 22.aEdge,
      color: Colors.white,
      height: 99,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                controller: _controller,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.mood,
                    color: Colors.grey,
                  ),
                  fillColor: AppColors.babyGreyColor,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: const BorderSide(
                        color: AppColors.smallTextColor, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide:
                        const BorderSide(color: AppColors.smallTextColor),
                  ),
                  focusColor: Colors.grey,
                  hintText: "اكتب رسالتك هنا",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          6.wSize,
          _isTyping
              ? InkWell(
                  onTap: () {
                    print('Message sent: ${_controller.text}');
                    _controller.clear();
                  },
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        color: AppColors.secondColor
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                      },
                      child: const Icon(Icons.send,
                          color: Colors.white, size: 30
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: AppColors.secondColor
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return const RecordScreen();
                        },
                      );
                    },
                    child: const Icon(Icons.mic_none_outlined,
                        color: Colors.white, size: 30
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
