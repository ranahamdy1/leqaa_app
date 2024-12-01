import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/widgets/sound/logic/record_provider.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/widgets/sound/widgets/waves_sound_widget.dart';
import 'package:provider/provider.dart';

class SoundSampleWidget extends StatelessWidget {
  const SoundSampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordingProvider>(
      create: (BuildContext context) => RecordingProvider(),
      builder: (context, child) => Consumer<RecordingProvider>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 60),
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
                          child: Row(
                            children: [
                              _buildTextButton("1x", AppColors.pageControllerColor),
                              3.wSize,
                              _buildTextButton(provider.formattedTime, AppColors.pageControllerColor, fontSize: 12),
                              3.wSize,
                              if (provider.isRecording && !provider.isPause)
                                _buildIconButton(Icons.pause, AppColors.pageControllerColorWithOpacity, () => provider.resetRecording()),
                              3.wSize,
                              if (provider.isRecording ^ ! provider.isRecording)
                                const Expanded(
                                  child: SoundWaveformWidget(
                                    color: AppColors.pageControllerColor,
                                    count: 12,
                                    minHeight: 10,
                                    maxHeight: 19,
                                  ),
                                ),
                              if (!provider.isRecording || provider.isPause)
                                _buildIconButton(Icons.play_arrow, AppColors.pageControllerColorWithOpacity, () => provider.startRecord())
                            ],
                          ),
                        ),
                      ),
                    ),
                    Image.asset("chat_container".getPngAsset),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 60),
                    child: ClipPath(
                      clipper: LowerNipMessageClipper(MessageType.send),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: const BoxDecoration(
                          color: AppColors.babyPinkColor,
                        ),
                        child: Row(
                          children: [
                            if (provider.isRecording && !provider.isPause)
                              _buildIconButton(Icons.pause, AppColors.secondColor, () => provider.resetRecording()),
                            if (!provider.isRecording || provider.isPause)
                              _buildIconButton(Icons.play_arrow, AppColors.secondColor, () => provider.startRecord()),
                            3.wSize,
                            if (provider.isRecording ^ ! provider.isRecording)
                              const Expanded(
                                child:  SoundWaveformWidget(
                                  color: AppColors.secondColor,
                                  count: 12,
                                  minHeight: 10,
                                  maxHeight: 19,
                                ),
                            ),
                            3.wSize,
                            _buildTextButton(provider.formattedTime, AppColors.secondColor, fontSize: 12),
                            3.wSize,
                            _buildTextButton("1x", AppColors.secondColor),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Text("13:00"),
                      Icon(Icons.done_all_outlined, color: AppColors.pageControllerColor),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTextButton(String text, Color color, {double fontSize = 14}) {
    return Container(
      height: 20,
      width: 66,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44),
        color: AppColors.whiteColor,
      ),
      child: Center(
        child: TextWidget(text, fontSize: fontSize, color: color),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color, VoidCallback onTap) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44),
        color: AppColors.whiteColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(icon, color: color),
      ),
    );
  }
}
