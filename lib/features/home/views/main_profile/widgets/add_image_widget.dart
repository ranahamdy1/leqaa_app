import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 124,
        width: 124,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          dashPattern: [6, 3],
          color: AppColors.secondColor,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.babyPinkColor,
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
        ),
      ),
    );
  }
}
