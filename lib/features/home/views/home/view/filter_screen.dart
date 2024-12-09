import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/custom_text_form_feild.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/filter_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController residenceController = TextEditingController();

  RangeValues _currentRangeValues = const RangeValues(25, 45);

  final List<bool> _selectedHobbies1 = List.generate(15, (_) => false);
  final List<bool> _selectedHobbies2 = List.generate(15, (_) => false);
  final List<bool> _selectedHobbies3 = List.generate(15, (_) => false);

  void _toggleSelection(List<bool> hobbiesList, int index) {
    setState(() {
      hobbiesList[index] = !hobbiesList[index];
    });
  }

  final TextEditingController _nationalityController = TextEditingController();
  final List<String> _nationalities = [
    "الكويت",
    "مصر",
    "السعودية",
    "الإمارات",
    "الأردن"
  ];
  String? _selectedNationality;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w), // Responsive padding
              child: Column(
                children: [
                  SizedBox(height: 22.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          AppRoutes.pop(context);
                        },
                        child: Image.asset("next".getPngAsset),
                      ),
                      const Spacer(),
                      const TextWidget.bigText("فلتر"),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  CustomTextFormField(
                    hintText: "الجنسية",
                    labelText: "الجنسية",
                    controller: _nationalityController,
                    kbType: TextInputType.text,
                    onChanged: (value) {},
                    suffixIcon: DropdownButton<String>(
                      icon: Icon(Icons.arrow_drop_down, size: 33.sp),
                      underline: const SizedBox(),
                      items: _nationalities
                          .map((nationality) => DropdownMenuItem<String>(
                        value: nationality,
                        child: Text(nationality),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _nationalityController.text = value!;
                        });
                      },
                      value: _selectedNationality,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CustomTextFormField(
                    hintText: "منطقة الاقامة",
                    labelText: "منطقة الاقامة",
                    controller: residenceController,
                    kbType: TextInputType.text,
                    onChanged: (value) {},
                    suffixIcon: Icon(Icons.arrow_drop_down, size: 33.sp),
                  ),
                  SizedBox(height: 18.h),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: TextWidget.bigText('العمر'),
                  ),
                  RangeSlider(
                    values: _currentRangeValues,
                    min: 15,
                    max: 105,
                    activeColor: AppColors.secondColor,
                    inactiveColor: AppColors.babyGreyColor,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        10,
                            (index) => Text(
                          '${105 - index * 10}',
                          style: TextStyle(
                            color: AppColors.pageControllerColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: TextWidget.mediumText('الالتزام الديني'),
                  ),
                  _buildHobbiesRow(_selectedHobbies1, 'التزام'),
                  SizedBox(height: 12.h),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: TextWidget.mediumText('الوضع المادي'),
                  ),
                  _buildHobbiesRow(_selectedHobbies2, 'الوضع'),
                  SizedBox(height: 12.h),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: TextWidget.mediumText('المؤهل'),
                  ),
                  _buildHobbiesRow(_selectedHobbies3, 'المؤهل'),
                  SizedBox(height: 99.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonWidget(
                        "تطبيق الفلتر",
                        color: AppColors.whiteColor,
                        backgroundColor: AppColors.pageControllerColor,
                        borderColor: AppColors.pageControllerColor,
                        width: 155.w,
                        onPressed: () {},
                      ),
                      SizedBox(width: 12.w),
                      CustomButtonWidget(
                        "مسح الفلتر",
                        color: AppColors.whiteColor,
                        backgroundColor: AppColors.secondColor,
                        borderColor: AppColors.secondColor,
                        width: 155.w,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHobbiesRow(List<bool> hobbiesList, String prefix) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hobbiesList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _toggleSelection(hobbiesList, index),
            child: FilterWidget(
              text: '$prefix $index',
              selected: hobbiesList[index],
            ),
          );
        },
      ),
    );
  }
}
