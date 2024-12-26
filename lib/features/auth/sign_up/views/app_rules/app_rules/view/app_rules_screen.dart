import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/app_rules/controller/app_rules_cubit.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/app_rules/controller/app_rules_state.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/choose_your_type_screen.dart';


class AppRulesScreen extends StatelessWidget {
  const AppRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppRulesCubit()..getRules(),
      child: BlocConsumer<AppRulesCubit, AppRulesState>(
        listener: (context, state) {
          if (state is AppRulesInitialState) {
            print("AppRulesInitialState");
          } else if (state is AppRulesSuccessState) {
            print("AppRulesSuccessState");
          } else if (state is AppRulesFailedState) {
            print("AppRulesFailedState: ${state.msg}");
          }
        },
        builder: (context, state) {
          final appRulesCubit = context.watch<AppRulesCubit>();
          return Scaffold(
            body: Padding(
              padding: 26.aEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  22.hSize,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("splash_dark".getPngAsset),
                    ],
                  ),
                  22.hSize,
                  const TextWidget.bigText("شروط وأحكام تطبيق لقاء"),
                  const TextWidget.smallText(
                    "باستخدام التطبيق الخاص بنا ، فإنك توافق على الامتثال للبنود والشروط التالية والالتزام بها يرجى مراجعتها بعناية.",
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: appRulesCubit.appRulesModel?.data?.termsConditions?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: RichText(
                            textDirection: TextDirection.rtl,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${index + 1}. ",
                                  style: const TextStyle(
                                    color: AppColors.pageControllerColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: "${appRulesCubit.appRulesModel?.data?.termsConditions![index]}",
                                  style: const TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Somar",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButtonWidget(
                          "موافق",
                          color: AppColors.whiteColor,
                          backgroundColor: AppColors.mainColor,
                          borderColor: AppColors.mainColor,
                          width: 122,
                          onPressed: () {
                            AppRoutes.routeTo(
                                context, const ChooseYourTypeScreen());
                          },
                        ),
                        CustomButtonWidget(
                          "إلغاء",
                          color: AppColors.whiteColor,
                          backgroundColor: AppColors.secondColor,
                          borderColor: AppColors.secondColor,
                          width: 122,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
