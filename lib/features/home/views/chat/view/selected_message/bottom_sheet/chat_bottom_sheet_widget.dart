import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/sound/logic/record_provider.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/sound/widgets/waves_sound_widget.dart';
import 'package:provider/provider.dart';

class ChatBottomSheetWidget extends StatefulWidget {
  ChatBottomSheetWidget({super.key, this.sendOnTap, required this.controller, required this.sendAudioOnTap});

  final TextEditingController controller;
  final VoidCallback? sendOnTap;
  void Function()? sendAudioOnTap;

  @override
  State<ChatBottomSheetWidget> createState() => _ChatBottomSheetWidgetState();
}

class _ChatBottomSheetWidgetState extends State<ChatBottomSheetWidget> {
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _isTyping = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 99,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 55,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                controller: widget.controller,
                decoration: _inputDecoration(),
              ),
            ),
          ),
          6.wSize,
          _buildActionButton(),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      suffixIcon: const Icon(Icons.mood, color: Colors.grey),
      fillColor: AppColors.babyGreyColor,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide: const BorderSide(
          color: AppColors.smallTextColor,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(33),
        borderSide: const BorderSide(color: AppColors.smallTextColor),
      ),
      hintText: "اكتب رسالتك هنا",
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildActionButton() {
    return InkWell(
      onTap: _isTyping ? widget.sendOnTap ?? _sendMessage : _showRecordModal,
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55),
          color: AppColors.secondColor,
        ),
        child: Icon(
          _isTyping ? Icons.send : Icons.mic_none_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  void _sendMessage() {
    print('Message sent: ${widget.controller.text}');
    widget.controller.clear();
  }

  void _showRecordModal() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return ChangeNotifierProvider<RecordingProvider>(
          create: (BuildContext context) => RecordingProvider(),
          builder: (context, child) => Consumer<RecordingProvider>(
            builder: (context, provider, child) {
              return Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (provider.isRecording)
                      const SizedBox(
                        height: 100,
                        child: SoundWaveformWidget(
                          color: AppColors.pageControllerColor,
                          count: 23,
                          minHeight: 33,
                          maxHeight: 77,
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (provider.isRecording)
                          Container(
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(44),
                              color: Colors.red,
                            ),
                          ),
                        const SizedBox(width: 5),
                        TextWidget(provider.formattedTime),
                      ],
                    ),
                    IconButton(
                      iconSize: 38,
                      icon: provider.isRecording
                          ? const Icon(Icons.stop, color: AppColors.pageControllerColor)
                          : const Icon(Icons.mic, color: AppColors.pageControllerColor),
                      onPressed: provider.toggleRecording,
                    ),
                    if (!provider.isRecording && provider.recordedAudioPath != null)
                      ElevatedButton(
                        onPressed: widget.sendAudioOnTap,
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.pageControllerColor),
                        child: const TextWidget("Send Audio",color: AppColors.whiteColor,),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

