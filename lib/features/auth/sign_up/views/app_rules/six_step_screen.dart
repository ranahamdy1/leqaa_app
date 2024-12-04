import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/seven_step_screen.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class SixStepScreen extends StatefulWidget {
  final int currentStep;
  SixStepScreen({super.key, required this.currentStep});

  @override
  State<SixStepScreen> createState() => _SixStepScreenState();
}

class _SixStepScreenState extends State<SixStepScreen> {
  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isCharacterSelectorVisible = false;
  final List<String> characters = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _isCharacterSelectorVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _insertCharacter(String character) {
    final currentText = _controller.text;
    final newText = '$currentText$character';
    _controller.text = newText;
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: newText.length));
    setState(() {
      _isCharacterSelectorVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                            currentStep: widget.currentStep,
                            progressType: LinearProgressBar.progressTypeLinear,
                            dotsActiveSize: 55,
                            progressColor: AppColors.pageControllerColor,
                            backgroundColor:
                                AppColors.pageControllerColorWithOpacity,
                            borderRadius: BorderRadius.circular(10), // NEW
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const TextWidget("خطوة 10/6"),
                12.hSize,
                const TextWidget.bigText("الشخصية"),
                12.hSize,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget.smallText(
                        "برجاء عمل اختبار الشخصية من خلال الرابط التالي"),
                    TextWidget(
                      "16personalities",
                      color: AppColors.secondColor,
                    ),
                  ],
                ),
                22.hSize,
                TextFormField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondColor, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.babyGreyColor),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _isCharacterSelectorVisible = true;
                    });
                  },
                ),
                if (_isCharacterSelectorVisible)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.babyPinkColor,
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
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(top: 20.0),
                        width: 188,
                        height: 122,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: characters.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => _insertCharacter(characters[index]),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(
                                  characters[index],
                                  style: const TextStyle(fontSize: 24.0),
                                  maxLines: 6,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                12.hSize,
                TextFormField(
                  maxLines: null,
                  minLines: 5,
                  decoration: InputDecoration(
                    hintText: 'مواصفاتك',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondColor, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.babyGreyColor),
                    ),
                  ),
                ),
                12.hSize,
                TextFormField(
                  maxLines: null,
                  minLines: 5,
                  decoration: InputDecoration(
                    hintText: 'مواصفات شريك حياتك',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secondColor, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.babyGreyColor),
                    ),
                  ),
                ),
                66.hSize,
                CustomButtonWidget(
                  "التالي",
                  color: AppColors.whiteColor,
                  backgroundColor: AppColors.mainColor,
                  borderColor: AppColors.mainColor,
                  width: double.infinity,
                  onPressed: () {
                    AppRoutes.routeTo(
                      context,
                      SevenStepScreen(currentStep: widget.currentStep + 1),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
