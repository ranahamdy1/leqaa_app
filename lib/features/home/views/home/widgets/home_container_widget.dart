import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/home/controller/most_match_accounts_cubit.dart';
import 'package:leqaa_app/features/home/views/home/controller/most_match_accounts_state.dart';
import 'package:leqaa_app/features/home/views/profile/view/profile_screen.dart';

class HomeContainerWidget extends StatelessWidget {
  const HomeContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MostMatchAcountCubit()..getMostMatchAccounts(),
      child: BlocConsumer<MostMatchAcountCubit, MostMatchAccountsState>(
        listener: (context, state) {
          if (state is MostMatchAccountsSuccessState) {
            print("Success: ${state.mostMatchAcountModel}");
          } else if (state is MostMatchAccountsFailedState) {
            print("Failed: ${state.msg}");
          }
        },
        builder: (context, state) {
          if (state is MostMatchAccountsLoadingState) {
            return const CircularProgressIndicator(color: AppColors.secondColor);
          } else if (state is MostMatchAccountsSuccessState) {
            final mostMatchAcount = context.watch<MostMatchAcountCubit>();
            return SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mostMatchAcount.mostMatchAcountModel?.data?.suggestions?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Container(
                      width: 343.w,
                      height: 122.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5.r,
                            blurRadius: 7.r,
                            offset: Offset(0, 3.h),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 66.h,
                            width: 66.h,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: ClipOval(
                                    child: Image.network(
                                      "${mostMatchAcount.mostMatchAcountModel?.data?.suggestions?[index].image}",
                                      fit: BoxFit.cover,
                                      width: 100, // Specify the desired width
                                      height: 100, // Specify the desired height
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    height: 33,
                                    width: 33,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                            BorderRadius.circular(40),
                                          ),
                                          height: 55,
                                          width: 55,
                                          child: CircularProgressIndicator(
                                            value: (mostMatchAcount.mostMatchAcountModel?.data?.suggestions?[index].match ?? 90) / 100,
                                            backgroundColor: AppColors.babyPinkColor,
                                            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondColor),
                                            strokeWidth: 5,
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "${mostMatchAcount.mostMatchAcountModel?.data?.suggestions?[index].match}%",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 9.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget.bigText(
                                    "${mostMatchAcount.mostMatchAcountModel?.data?.suggestions?[index].name}"),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.secondColor,
                                      size: 15,
                                    ),
                                    TextWidget(
                                      "${mostMatchAcount.mostMatchAcountModel?.data?.suggestions?[index].country}",
                                      color: AppColors.secondColor,
                                    ),
                                  ],
                                ),
                                const TextWidget.smallText(
                                  "يضم التطبيق أكثر من 800000 عضو من جميع أنحاء العالم العربي",
                                  fontSize: 9,
                                ),
                                const TextWidget.smallText(
                                  " دول الخليج وأوروبا وأمريكا الشمالية.",
                                  fontSize: 9,
                                ),
                                SizedBox(
                                    height: 5.h), // Responsive vertical spacing
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        AppRoutes.routeTo(
                                            context, const ProfileScreen());
                                      },
                                      child: Container(
                                        width: 99.w,
                                        height: 33.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(6.r),
                                          color: AppColors.pageControllerColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                            SizedBox(width: 3.w),
                                            const TextWidget.smallText(
                                              "مشاهدة  ملف سارة",
                                              color: Colors.white,
                                              fontSize: 9,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Container(
                                      width: 99.w,
                                      height: 33.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.r),
                                        color: AppColors.secondColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Colors.white,
                                            size: 13,
                                          ),
                                          SizedBox(width: 3.w),
                                          const TextWidget.smallText(
                                            "مشاهدة  ملف سارة",
                                            color: Colors.white,
                                            fontSize: 9,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return ErrorWidget("Error occurred");
          }
        },
      ),
    );
  }
}
