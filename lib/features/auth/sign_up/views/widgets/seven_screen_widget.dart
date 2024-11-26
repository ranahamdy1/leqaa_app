import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';

class SevenScreenWidget extends StatelessWidget {
  const SevenScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: AppColors.secondColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(44),
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.secondColor,
            ),
          ),
        ),
      ),
    );
  }
}
