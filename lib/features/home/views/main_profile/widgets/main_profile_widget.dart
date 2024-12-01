import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';

class MainProfileWidget extends StatelessWidget {
  const MainProfileWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
      child: Container(
        width: 361,
        height: 56,
        padding:  const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset("about".getPngAsset),
            9.wSize,
            Text(text),
            const Spacer(),
            const Icon(Icons.arrow_forward,color: AppColors.secondColor,)
          ],
        ),
      ),
    );
  }
}
