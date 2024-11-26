import 'package:flutter/material.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? body;
  final String text;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  const CustomAppBar({super.key, required this.body, required this.text, this.actions, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              //color: AppColors.greyColor,
              height: 1.0,
            ),
        ),
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child:
            TextWidget(text, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        actions: actions,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
