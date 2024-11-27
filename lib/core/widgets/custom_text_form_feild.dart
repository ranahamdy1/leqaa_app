import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType kbType;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Function? onSubmit;
  final Function? onChange;
  final Function? onTap;
  final String? labelText;
  final bool? isObscureText;
  final validator;
  final String? value;

  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    required this.hintText,
    required this.kbType,
    required this.controller,
    this.onSubmit,
    this.onChange,
    this.onTap,
    required Null Function(dynamic value) onChanged,
    this.labelText,
    this.isObscureText,
    this.validator,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: TextWidget.smallText(
            labelText ?? '',
          ),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          suffixIcon: suffixIcon,
          isDense: false,
          fillColor: Colors.transparent,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColors.secondColor, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColors.babyGreyColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColors.babyGreyColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: AppColors.babyGreyColor),
          ),
          focusColor: AppColors.mainColor,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        obscureText: isObscureText ?? false,
        validator: validator,
      ),
    );
  }
}
