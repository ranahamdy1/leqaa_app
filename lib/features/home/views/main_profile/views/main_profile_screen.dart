import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/discount_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/views/edit_hoppies_screen.dart';
import 'package:leqaa_app/features/home/views/main_profile/views/update_image_screen.dart';
import 'package:leqaa_app/features/home/views/main_profile/widgets/main_profile_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/widgets/sign_out_widget.dart';
import 'package:leqaa_app/features/payment/moyasar/moyasara_screen.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const TextWidget.bigText("الملف الشخصي"),
              12.hSize,
              /*pickedImages.isNotEmpty
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 124,
                  height: 124,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Image.file(
                    File(pickedImages.last.path),
                    fit: BoxFit.cover,
                  ),
                ),
              )
                  : Image.asset(
                "add_image".getPngAsset,
                height: 124,
                width: 124,
              ),*/
              InkWell(
                onTap: (){
                 //AppRoutes.routeTo(context, const UpdateImageScreen());
                },
                child: Container(
                  width: 87,
                  height: 87,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    border: Border.all(
                      color: AppColors.pageControllerColorWithOpacity,
                      width: 8.0,
                    ),
                  ),
                  child: Image.asset("main_profil_image".getPngAsset),
                ),
              ),
              12.hSize,
              const TextWidget.bigText("محمد عبدالرحمن"),
              12.hSize,
              const DiscountWidget(),
              12.hSize,
              InkWell(
                onTap: (){
                  AppRoutes.routeTo(context, const UpdateImageScreen());
                },
                  child: const MainProfileWidget(text: 'تعديل الملف الشخصي',)),
              InkWell(
                onTap: (){
                  AppRoutes.routeTo(context, const EditHoppiesScreen());
                },
                  child: const MainProfileWidget(text: 'تعديل الهوايات',)),
              InkWell(
                  onTap: (){
                    AppRoutes.routeTo(context, MoyasaraScreen());
                  },
                  child: const MainProfileWidget(text: 'دفع',)),
              const MainProfileWidget(text: 'تعديل الهوايات',),
              const MainProfileWidget(text: 'تعديل الهوايات',),
              const MainProfileWidget(text: 'تعديل الهوايات',),
              const MainProfileWidget(text: 'تعديل الهوايات',),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
                child: CustomButtonWidget(
                    " حذف الحساب",
                    width: double.infinity,
                    color: AppColors.secondColor,
                    borderColor: AppColors.secondColor,
                    backgroundColor: AppColors.whiteColor,
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SignOutWidget();
                        },
                      );
                    },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


