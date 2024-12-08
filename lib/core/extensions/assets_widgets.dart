import 'package:flutter/material.dart';

extension Assets on int {
  // SizedBoxs
  SizedBox get hSize => SizedBox(height: toDouble());
  SizedBox get wSize => SizedBox(width: toDouble());
  SizedBox get sSize => SizedBox(height: toDouble(), width: toDouble());
  // EdgeInsets
  EdgeInsets get aEdge => EdgeInsets.all(toDouble());
  EdgeInsets get hEdge => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vEdge => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get vhEdge => EdgeInsets.symmetric(
    vertical: toDouble() / 2,
    horizontal: toDouble(),
  );
  EdgeInsets get hvEdge => EdgeInsets.symmetric(
    vertical: toDouble(),
    horizontal: toDouble() / 2,
  );
  //
  BorderRadius get cBorder => BorderRadius.circular(toDouble());
  //
  Divider get divider =>
      Divider(thickness: toDouble(), color: const Color(0xffF2F4F7));
}

/*
* import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Assets on int {
  // SizedBoxs
  SizedBox get hSize => SizedBox(height: h);
  SizedBox get wSize => SizedBox(width: w);
  SizedBox get sSize => SizedBox(height: h, width: w);

  // EdgeInsets
  EdgeInsets get aEdge => EdgeInsets.all(w);
  EdgeInsets get hEdge => EdgeInsets.symmetric(horizontal: w);
  EdgeInsets get vEdge => EdgeInsets.symmetric(vertical: h);
  EdgeInsets get vhEdge => EdgeInsets.symmetric(
    vertical: h / 2,
    horizontal: w,
  ); // Custom responsive padding
  EdgeInsets get hvEdge => EdgeInsets.symmetric(
    vertical: h,
    horizontal: w / 2,
  ); // Custom responsive padding

  // BorderRadius
  BorderRadius get cBorder => BorderRadius.circular(r); // Responsive border radius

  // Divider
  Divider get divider => Divider(
    thickness: h, // Responsive thickness
    color: const Color(0xffF2F4F7),
  );
}

extension Responsive on int {
  double get h => h.h; // Convert height to responsive
  double get w => w.w; // Convert width to responsive
  double get r => r.r; // Convert radius to responsive
}
*/