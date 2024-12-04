import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/bottom_sheet/chat_bottom_sheet_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/sound/logic/record_provider.dart';
import 'package:provider/provider.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';

class ChatBodyScreen extends StatelessWidget {
  ChatBodyScreen({Key? key}) : super(key: key);

  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> showScrollDownButton = ValueNotifier(false);
  final AudioPlayer _audioPlayer = AudioPlayer();

  void onSendMessage(String message) async {
    if (message.isNotEmpty) {
      final messages = {
        "sendby": _auth.currentUser?.displayName ?? "Unknown",
        "message": message,
        "audioUrl": "",
        "time": FieldValue.serverTimestamp(),
      };
      _message.clear();
      await _firestore.collection('global_chats').add(messages);
    }
  }

  void onSendAudio(RecordingProvider provider) async {
    if (provider.recordedAudioPath != null) {
      try {
        await provider.uploadAudio();
        final audioUrl = provider.audioUrl;
        if (audioUrl != null && audioUrl.isNotEmpty) {
          final messages = {
            "sendby": _auth.currentUser?.displayName ?? "Unknown",
            "message": "",
            "audioUrl": audioUrl,
            "time": FieldValue.serverTimestamp(),
          };
          await _firestore.collection('global_chats').add(messages);
        }
      } catch (e) {
        print("Error uploading audio: $e");
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      } else {
        var snapshot = await _firestore.collection('global_chats').get();
        if (snapshot.docs.isNotEmpty) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      }
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 50) {
        showScrollDownButton.value = false;
      } else {
        showScrollDownButton.value = true;
      }
    });

    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<RecordingProvider>(
      create: (_) => RecordingProvider(),
      builder: (context, child) => Consumer<RecordingProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  33.hSize,
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
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('global_chats').orderBy("time").snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text("Error: ${snapshot.error}"));
                        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(child: Text("No messages yet."));
                        }

                        for (var doc in snapshot.data!.docs) {
                          final map = doc.data() as Map<String, dynamic>;
                          print("Message: ${map['message']}, Audio URL: ${map['audioUrl']}");
                        }

                        return ListView.builder(
                          controller: scrollController,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final map = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                            return messages(size, map);
                          },
                        );
                      },
                    ),
                  ),
                  ChatBottomSheetWidget(
                    controller: _message,
                    sendOnTap: () => onSendMessage(_message.text),
                    sendAudioOnTap: () {
                      onSendAudio(provider);
                      print(provider.audioUrl);
                      if (provider.audioUrl != null && provider.audioUrl!.isNotEmpty) {
                        AppRoutes.pop(context);
                      } else {
                        print("Audio URL is empty or null.");
                      }
                    },

                  ),
                ],
              ),
            ),
            floatingActionButton: ValueListenableBuilder<bool>(
              valueListenable: showScrollDownButton,
              builder: (context, isVisible, child) {
                return isVisible ? FloatingActionButton(
                  onPressed: () {
                    scrollController.jumpTo(scrollController.position.maxScrollExtent);
                    showScrollDownButton.value = false;
                  },
                  backgroundColor: AppColors.pageControllerColor,
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
                ) : const SizedBox.shrink();
              },
            ),
          );
        },
      )
    );
  }

  Widget messages(Size size, Map<String, dynamic> map) {
    final String? message = map['message'] as String?;
    final String? audioUrl = map['audioUrl'] as String?;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.end,
        children: [
          if (message != null && message.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: map['sendby'] == _auth.currentUser?.displayName
                        ? AppColors.mainColor
                        : AppColors.pageControllerColor,
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                5.wSize,
                Image.asset("chat_container".getPngAsset),
              ],
            ),
          if (audioUrl != null && audioUrl.isNotEmpty)
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow, color: AppColors.pageControllerColor),
                  onPressed: () async {
                    try {
                      print("Playing audio from URL: $audioUrl");
                      await _audioPlayer.play(UrlSource(audioUrl));
                    } catch (e) {
                      print("Error playing audio: $e");
                    }
                  },
                ),
                const Text("Audio Message"),
              ],
            ),

        ],
      ),
    );
  }
}

