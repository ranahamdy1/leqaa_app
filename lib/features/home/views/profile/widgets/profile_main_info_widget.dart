import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class ProfileMainInfoWidget extends StatelessWidget {
  const ProfileMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 364,
        height: 188,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget.bigText("معلومات أساسية",color: AppColors.secondColor,),
                ],
              ),
              DottedBorder(
                strokeWidth: 1,
                dashPattern: [6, 5],
                color: AppColors.secondColor,
                customPath: (size) {
                  return Path()..moveTo(0, size.height / 2)..lineTo(size.width, size.height / 2);
                },
                child: const SizedBox(
                  height: 1,
                  width: double.infinity,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget.smallText("القيبلة / العائلة"),
                  TextWidget.mediumText("اسم القيبلة / أو العائلة"),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget.smallText("النسب"),
                  TextWidget.mediumText("نسب المستخدم"),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget.smallText("القيبلة / العائلة"),
                  TextWidget.mediumText("اسم القيبلة / أو العائلة"),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget.smallText("القيبلة / العائلة"),
                  TextWidget.mediumText("اسم القيبلة / أو العائلة"),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget.smallText("القيبلة / العائلة"),
                  TextWidget.mediumText("اسم القيبلة / أو العائلة"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

