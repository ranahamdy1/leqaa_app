import 'package:flutter/material.dart';

import 'FontWeightHelper.dart';
import 'app_colors.dart';


class TextStyles {
  static TextStyle font24mainBlueColor = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Roboto',
    color: AppColors.mainColor
  );

  static TextStyle font11black = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Roboto',
  );

  static TextStyle font12black = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Roboto',
  );



   static TextStyle font16black = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Roboto',
  );

  static TextStyle font20mainBlueColor = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.bold,
    fontFamily: 'Roboto',
  );
}
