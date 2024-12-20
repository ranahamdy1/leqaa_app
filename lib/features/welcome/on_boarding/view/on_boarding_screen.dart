import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/welcome/on_boarding/controller/on_boarding/on_boarding_cubit.dart';
import 'package:leqaa_app/features/welcome/on_boarding/view/start_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
      create: (context) => OnBoardingCubit(),
      child:BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GoToHomeState) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                AppRoutes.routeAndRemoveAllTo(context, StartScreen());
              });
            }
            final onBoarding = context.watch<OnBoardingCubit>();
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: onBoarding.pageController,
                        onPageChanged: (page) {
                          context.read<OnBoardingCubit>().changePage(page);
                        },
                        itemCount: onBoarding.onBoardingList.length,
                        itemBuilder: (context, i) => Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height/1.9,
                              child: Stack(
                                children: [
                                  Image.asset(onBoarding.onBoardingList[i].image),
                                  Center(child: Image.asset("on_boarding_one".getPngAsset)),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Image.asset("border".getPngAsset),
                                  ),
                                ],
                              ),
                            ),
                            33.hSize,
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  TextWidget.bigText(onBoarding.onBoardingList[i].title),
                                  33.hSize,
                                  TextWidget.smallText(onBoarding.onBoardingList[i].body),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                    onBoarding.onBoardingList.length,
                                    (index) => AnimatedContainer(
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.bounceInOut,
                                          width: index == onBoarding.currentPage ? 44 : 8,
                                          height: 8,
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: index == onBoarding.currentPage
                                                ? AppColors.pageControllerColor
                                                : AppColors.pageControllerColorWithOpacity,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onBoarding.currentPage == onBoarding.onBoardingList.length - 1
                        ? Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: CustomButtonWidget(
                        "ابدأ",
                        color: AppColors.whiteColor,
                        backgroundColor: AppColors.mainColor,
                        borderColor: AppColors.mainColor,
                        width: double.infinity,
                        onPressed: (){
                          AppRoutes.routeAndRemoveAllTo(context, StartScreen());
                        },
                      ),
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButtonWidget(
                          "next".tr(),
                          color: AppColors.whiteColor,
                          backgroundColor: AppColors.mainColor,
                          borderColor: AppColors.mainColor,
                          width: 155,
                          onPressed: (){
                            context.read<OnBoardingCubit>().next();
                          },
                        ),
                        22.wSize,
                        InkWell(
                            onTap: (){
                              AppRoutes.routeAndRemoveAllTo(context, StartScreen());
                            },
                            child: TextWidget.bigText("skip".tr(),color: AppColors.secondColor,)),
                      ],
                    ),
                    77.hSize,
                  ],
                ),
              ),
            );
          },
        ),
    );
  }
}
