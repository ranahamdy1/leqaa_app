import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/nine_step_screen.dart';
import 'package:leqaa_app/features/auth/sign_up/views/widgets/eight_screen_widget.dart';
import 'package:leqaa_app/features/home/views/profile/controller/hobby/hobby_cubit.dart';
import 'package:leqaa_app/features/home/views/profile/controller/hobby/hobby_state.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class EightStepScreen extends StatefulWidget {
  final int currentStep;
  const EightStepScreen({super.key, required this.currentStep});

  @override
  _EightStepScreenState createState() => _EightStepScreenState();
}

class _EightStepScreenState extends State<EightStepScreen> {
  List<int> selectedHobbyIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: 12.aEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset("next".getPngAsset),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: SizedBox(
                          height: 9,
                          child: LinearProgressBar(
                            maxSteps: 10,
                            currentStep: widget.currentStep,
                            progressType: LinearProgressBar.progressTypeLinear,
                            dotsActiveSize: 55,
                            progressColor: AppColors.pageControllerColor,
                            backgroundColor: AppColors.pageControllerColorWithOpacity,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const TextWidget("خطوة 10/8"),
                12.hSize,
                const TextWidget.bigText("أضف هواياتك"),
                12.hSize,
                SizedBox(
                  child: BlocProvider(
                    create: (context) => HobbiesCubit()..fetchHobbies(),
                    child: BlocConsumer<HobbiesCubit, HobbiesState>(
                      listener: (context, state) {
                        if (state is HobbiesFailedState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.msg),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (state is HobbiesSuccessState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("تم تحميل البيانات بنجاح"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is HobbiesLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondColor,
                            ),
                          );
                        } else if (state is HobbiesSuccessState) {
                          final hobbies = state.hobbiesModel.data ?? [];

                          if (hobbies.isEmpty) {
                            return const Center(child: Text("No hobbies available"));
                          }

                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width,
                            ),
                            child: Column(
                              children: [
                                for (var i = 0; i < hobbies.length; i += 3)
                                  Row(
                                    children: hobbies.skip(i).take(3).map((hobby) {
                                      int currentIndex = i + hobbies.indexOf(hobby);
                                      return Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (selectedHobbyIndices.contains(currentIndex)) {
                                                  // Deselect hobby
                                                  selectedHobbyIndices.remove(currentIndex);
                                                } else {
                                                  // Select hobby
                                                  selectedHobbyIndices.add(currentIndex);
                                                }
                                              });
                                            },
                                            child: EightScreenWidget(
                                              image: hobby.image ?? '',
                                              text: hobby.title ?? '',
                                              isSelected: selectedHobbyIndices.contains(currentIndex),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                              ],
                            ),
                          );
                        } else if (state is HobbiesFailedState) {
                          return Center(child: Text(state.msg));
                        } else {
                          return const Center(child: Text("No data available"));
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButtonWidget(
                    "التالي",
                    color: AppColors.whiteColor,
                    backgroundColor: AppColors.mainColor,
                    borderColor: AppColors.mainColor,
                    onPressed: () {
                      AppRoutes.routeTo(
                        context,
                        NineStepScreen(currentStep: widget.currentStep + 1),
                      );
                    },
                  ),
                ),
                22.hSize,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
