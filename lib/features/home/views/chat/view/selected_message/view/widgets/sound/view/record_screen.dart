import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/widgets/sound/logic/record_provider.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/widgets/sound/widgets/waves_sound_widget.dart';
import 'package:provider/provider.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    color: AppColors.secondColor,
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
                const SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        provider.resetRecording();
                      },
                        child: const Icon(Icons.delete_outline_outlined, color: Colors.red)),
                    if (provider.isRecording)
                    InkWell(
                      onTap: () {
                        provider.pauseRecording();
                      },
                      child: SvgPicture.asset('pause'.getSvgAsset),
                    ),
                      InkWell(
                        onTap: (){
                          provider.startRecord();
                        },
                        child: const Icon(Icons.play_arrow,color: Colors.red,),
                      ),
                    if (provider.isRecording ^ provider.isPause)
                      InkWell(
                      onTap: () {
                        AppRoutes.pop(context);
                      },
                      child: SvgPicture.asset('send'.getSvgAsset),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
    );
  }
}
