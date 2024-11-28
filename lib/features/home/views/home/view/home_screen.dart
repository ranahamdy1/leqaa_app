import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/discount_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/home_container_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0,left: 18.0,right: 18.0),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                22.hSize,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextWidget.bigText("مرحبا محمد"),
                        9.hSize,
                        const TextWidget.mediumText("أهلا بك فى لقاء !", color: AppColors.pageControllerColor),
                      ],
                    ),
                    Image.asset("notification".getPngAsset),
                  ],
                ),
                12.hSize,
                const SearchWidget(),
                12.hSize,
                const DiscountWidget(),
                12.hSize,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget("الأكثر توافق"),
                    TextWidget("عرض المزيد", color: AppColors.pageControllerColor),
                  ],
                ),
                12.hSize,
                SizedBox(
                  height: 444,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const HomeContainerWidget();
                    },
                  ),
                ),
                12.hSize,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget("متوافقين"),
                    TextWidget("عرض المزيد", color: AppColors.pageControllerColor),
                  ],
                ),
                12.hSize,
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return const HomeContainerWidget();
                    },
                  ),
                ),
                12.hSize,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget("اقتراحات أخرى"),
                    TextWidget("عرض المزيد", color: AppColors.pageControllerColor),
                  ],
                ),
                12.hSize,
                const HomeContainerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
