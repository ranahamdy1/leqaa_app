import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/features/home/views/main_profile/views/edit_hoppies_screen.dart';

class MainProfileWidget extends StatelessWidget {
  const MainProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
      child: InkWell(
        onTap: (){
          AppRoutes.routeTo(context, const EditHoppiesScreen());
        },
        child: Container(
          width: 361,
          height: 56,
          padding:  const EdgeInsets.all(8.0),
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
          child: Row(
            children: [
              Image.asset("about".getPngAsset),
              9.wSize,
              const Text("تعديل الهوايات"),
              const Spacer(),
              const Icon(Icons.arrow_forward,color: AppColors.secondColor,)
            ],
          ),
        ),
      ),
    );
  }
}
