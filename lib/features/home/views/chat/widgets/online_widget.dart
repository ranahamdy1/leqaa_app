import 'package:flutter/material.dart';

class OnlineWidget extends StatelessWidget {
  const OnlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55),
        color: Colors.green
      ),
    );
  }
}
