import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/widgets/edit_hoppies_widget.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class EditHoppiesScreen extends StatefulWidget {
  const EditHoppiesScreen({super.key});

  @override
  _EditHoppiesScreenState createState() => _EditHoppiesScreenState();
}

class _EditHoppiesScreenState extends State<EditHoppiesScreen> {
  final List<bool> _selectedHobbies = [false, false, false, false, false, false, false];

  void _toggleSelection(int index) {
    setState(() {
      _selectedHobbies[index] = !_selectedHobbies[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: 12.aEdge,
          child: Column(
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
                          currentStep: 1,
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
              const TextWidget.bigText("تعديل الهوايات"),
              12.hSize,
              Row(
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () => _toggleSelection(index),
                    child: EditHoppiesScreenWidget(
                      image: 'movie',
                      text: 'مشاهدة الافلام',
                      selected: _selectedHobbies[index],
                    ),
                  );
                }),
              ),
              Row(
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () => _toggleSelection(index + 3),
                    child: EditHoppiesScreenWidget(
                      image: 'movie',
                      text: 'مشاهدة الافلام',
                      selected: _selectedHobbies[index + 3],
                    ),
                  );
                }),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _toggleSelection(6),
                    child: EditHoppiesScreenWidget(
                      image: 'movie',
                      text: 'مشاهدة الافلام',
                      selected: _selectedHobbies[6],
                    ),
                  ),
                ],
              ),
              88.hSize,
              CustomButtonWidget(
                "التالي",
                color: AppColors.whiteColor,
                backgroundColor: AppColors.mainColor,
                borderColor: AppColors.mainColor,
                width: double.infinity,
                onPressed: () {
                  // AppRoutes.routeTo(context, NineStepScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
