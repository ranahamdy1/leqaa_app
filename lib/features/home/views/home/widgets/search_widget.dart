import 'package:flutter/material.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/features/home/views/home/view/filter_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'بحث',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: AppColors.babyGreyColor,
        suffixIcon: InkWell(
          onTap: (){
            AppRoutes.routeTo(context, const FilterScreen());
          },
            child: Image.asset("search".getPngAsset)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.babyGreyColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(color: AppColors.babyGreyColor),
        ),
      ),
    );
  }
}
