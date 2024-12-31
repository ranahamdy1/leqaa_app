import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/widgets/eight_screen_widget.dart';
import 'package:leqaa_app/features/home/views/profile/controller/hobby/hobby_cubit.dart';
import 'package:leqaa_app/features/home/views/profile/controller/hobby/hobby_state.dart';

class HoppiesWidget extends StatefulWidget {
  const HoppiesWidget({super.key});

  @override
  _HoppiesWidgetState createState() => _HoppiesWidgetState();
}

class _HoppiesWidgetState extends State<HoppiesWidget> {
  List<int> selectedHobbyIndices = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 364,
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

                  return Column(
                    mainAxisSize: MainAxisSize
                        .min, // Ensure column size adapts to children
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget.bigText(
                            "الهوايات",
                            color: AppColors.secondColor,
                          ),
                        ],
                      ),
                      DottedBorder(
                        strokeWidth: 1,
                        dashPattern: const [6, 5],
                        color: AppColors.secondColor,
                        customPath: (size) {
                          return Path()..moveTo(0, size.height / 2)..lineTo(size.width, size.height / 2);
                        },
                        child: const SizedBox(
                          height: 1,
                          width: double.infinity,
                        ),
                      ),
                      // Wrap with spacing to avoid crowded UI
                      ConstrainedBox(
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
                      ),
                    ],
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
      ),
    );
  }
}
