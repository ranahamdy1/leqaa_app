import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

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
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget.bigText("سارة عبد الرحمن , 24 سنة  "),
                  9.hSize,
                  const TextWidget.smallText("يضم التطبيق أكثر من 800000 عضو من جميع أنحاء العالم العربي",fontSize: 9,),
                  const TextWidget.smallText(" دول الخليج وأوروبا وأمريكا الشمالية.",fontSize: 9,),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 55,
                    width: 55,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: 100,
                          width: 100,
                          child: const CircularProgressIndicator(
                            value: 90 / 100,
                            backgroundColor: AppColors.babyPinkColor,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.secondColor
                            ),
                            strokeWidth: 5,
                          ),
                        ),
                        const Text(
                          "${90 ?? 0}%",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.wSize,
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget.mediumText("نسبة التطابق"),
                      TextWidget.smallText("يوجد احتمالية تطابق بينكما بنسبة تصل إلى 90%")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
