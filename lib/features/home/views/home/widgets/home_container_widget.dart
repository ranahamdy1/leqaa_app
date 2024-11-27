import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/profile/view/profile_screen.dart';

class HomeContainerWidget extends StatelessWidget {
  const HomeContainerWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 363,
        height: 133,
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
            SizedBox(
                height: 66,
                width: 66,
                child: Image.asset("home_image".getPngAsset),
            ),
            9.wSize,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget.bigText("سارة عبد الرحمن , 24 سنة  "),
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: AppColors.secondColor,size: 15,),
                    TextWidget("الكويت",color: AppColors.secondColor,)
                  ],
                ),
                const TextWidget.smallText("يضم التطبيق أكثر من 800000 عضو من جميع أنحاء العالم العربي",fontSize: 9,),
                const TextWidget.smallText(" دول الخليج وأوروبا وأمريكا الشمالية.",fontSize: 9,),
                5.hSize,
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        AppRoutes.routeTo(context, ProfileScreen());
                      },
                      child: Container(
                        width: 99,
                        height: 33,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.pageControllerColor
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.remove_red_eye_outlined,color: Colors.white,size: 13,),
                            3.wSize,
                            const TextWidget.smallText("مشاهدة  ملف سارة",color: Colors.white,fontSize: 9,)
                          ],
                        ),
                      ),
                    ),
                    5.wSize,
                    Container(
                      width: 99,
                      height: 33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.secondColor
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.remove_red_eye_outlined,color: Colors.white,size: 13,),
                          3.wSize,
                          const TextWidget.smallText("مشاهدة  ملف سارة",color: Colors.white,fontSize: 9,)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
