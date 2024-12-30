import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/controller/about_app/about_app_cubit.dart';
import 'package:leqaa_app/features/home/views/main_profile/controller/about_app/about_app_state.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutAppCubit()..getAboutApp(),
      child: BlocConsumer<AboutAppCubit, AboutAppState>(
        listener: (context, state) {
          if (state is AboutAppDioInitialState) {
            print("AboutAppDioInitialState");
          } else if (state is AboutAppSuccessState) {
            print("AboutAppSuccessState");
          } else if (state is AboutAppStateFailedState) {
            print("AboutAppStateFailedState: ${state.msg}");
          }
        },
        builder: (context, state) {
          final aboutApp = context.watch<AboutAppCubit>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  66.hSize,
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            AppRoutes.pop(context);
                          },
                          child: Image.asset("next".getPngAsset)),
                      const Spacer(),
                      const TextWidget.bigText("عن التطبيق"),
                      const Spacer(),
                    ],
                  ),
                  22.hSize,
                  Container(
                    width: 400,
                    padding: 12.aEdge,
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
                    child: Column(
                      children: [
                        Image.asset("splash_dark".getPngAsset),
                        12.hSize,
                        const TextWidget.bigText(
                          "حول التطبيق", color: AppColors.secondColor,),
                        22.hSize,
                        TextWidget.smallText(
                          aboutApp.aboutAppModel?.data?.aboutApp ?? ""
                        ),
                        22.hSize,
                      ],
                    ),
                  ),
                  22.hSize,
                  const TextWidget.mediumText("صنع بكل حب ❤ في معامل جدارة")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
