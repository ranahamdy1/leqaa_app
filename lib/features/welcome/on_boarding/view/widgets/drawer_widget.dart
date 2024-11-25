import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.text, this.onPressed, required this.image});
  final String text;
  final String image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          12.wSize,
          Image.asset(image.getPngAsset),
          12.wSize,
          TextWidget(text)
        ],
      ),
    );
  }
}
