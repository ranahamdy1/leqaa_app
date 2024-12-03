import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/chat/view/selected_message/view/widgets/bottom_sheet/chat_bottom_sheet_widget.dart';

class ChatBodyScreen extends StatelessWidget {
  ChatBodyScreen({super.key});

  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> showScrollDownButton = ValueNotifier(false);

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": _auth.currentUser?.displayName ?? "Unknown",
        "message": _message.text,
        "time": FieldValue.serverTimestamp(),
      };
      _message.clear();
      await _firestore.collection('global_chats').add(messages);
    } else {
      print("Enter Some Text");
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
    return Scaffold(
      body: Column(
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
              stream: _firestore
                  .collection('global_chats')
                  .orderBy("time", descending: false)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No messages yet."));
                }
                return ListView.builder(
                  controller: scrollController,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> map = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                    return messages(size, map);
                  },
                );
              },
            ),
          ),
          ChatBottomSheetWidget(controller: _message, sendOnTap: onSendMessage),
        ],
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
  }

  Widget messages(Size size, Map<String, dynamic> map) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: map['sendby'] != _auth.currentUser?.displayName
          ? Row(
        children: [
          Container(
            width: 333,
            alignment: map['sendby'] == _auth.currentUser?.displayName ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: map['sendby'] == _auth.currentUser?.displayName ? AppColors.mainColor : AppColors.pageControllerColor,
              ),
              child: Text(
                map['message'],
                style: const TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Image.asset("chat_container".getPngAsset)
        ],
      )
          : Column(
        children: [
          Container(
            width: 333,
            alignment: map['sendby'] == _auth.currentUser?.displayName ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: map['sendby'] == _auth.currentUser?.displayName ? AppColors.mainColor : AppColors.pageControllerColor,
              ),
              child: Text(
                map['message'],
                style: const TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
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
    );
  }
}
