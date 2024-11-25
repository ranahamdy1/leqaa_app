import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';

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
          label: Text(
            labelText ?? '',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          suffixIcon: suffixIcon,
          isDense: false,
          fillColor: Colors.transparent,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            //borderSide: const BorderSide(color: AppColors.greyColor, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            //borderSide: const BorderSide(color: AppColors.greyColor, width: 1.5,),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            //borderSide: const BorderSide(color: AppColors.greyColor, width: 1.5,),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            //borderSide: const BorderSide(color: AppColors.greyColor),
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
