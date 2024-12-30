import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/home/views/home/widgets/discount_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/views/about_app_screen.dart';
import 'package:leqaa_app/features/home/views/main_profile/views/edit_hoppies_screen.dart';
import 'package:leqaa_app/features/home/views/main_profile/views/update_image_screen.dart';
import 'package:leqaa_app/features/home/views/main_profile/widgets/delete_account_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/widgets/main_profile_widget.dart';
import 'package:leqaa_app/features/home/views/main_profile/widgets/sign_out_widget.dart';
import 'package:leqaa_app/features/payment/moyasar/moyasara_screen.dart';

class MainProfileScreen extends StatelessWidget {
  MainProfileScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextWidget.bigText("profile".tr()),
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
                onTap: () {
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
                  onTap: () {
                    AppRoutes.routeTo(context, const UpdateImageScreen());
                  },
                  child: const MainProfileWidget(
                    text: 'تعديل الملف الشخصي',
                  )),
              InkWell(
                  onTap: () {
                    AppRoutes.routeTo(context, const EditHoppiesScreen());
                  },
                  child: const MainProfileWidget(
                    text: 'تعديل الهوايات',
                  )),
              InkWell(
                  onTap: () {
                    AppRoutes.routeTo(context, MoyasaraScreen());
                  },
                  child: const MainProfileWidget(
                    text: 'دفع',
                  )),
              InkWell(
                  onTap: () {
                    AppRoutes.routeTo(context, const AboutAppScreen());
                  },
                  child: const MainProfileWidget(
                    text: 'عن التطبيق',
                  )),
              InkWell(
                onTap: () {
                  if (context.locale == const Locale('ar')) {
                    context.setLocale(const Locale("en"));
                  } else {
                    context.setLocale(const Locale("ar"));
                  }
                },
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Container(
                    width: 361,
                    height: 56,
                    padding: const EdgeInsets.all(8.0),
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
                        const Text("اللغة"),
                        const Spacer(),
                        context.locale == const Locale('ar')
                            ? const TextWidget.bigText(
                          "عربي",
                          color: AppColors.secondColor,
                        )
                            : const TextWidget(
                          "English",
                          color: AppColors.secondColor,
                        ),
                        2.wSize
                      ],
                    ),
                  ),
                ),
              ),
              const MainProfileWidget(
                text: 'تعديل الهوايات',
              ),
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const SignOutWidget();
                      },
                    );
                  },
                  child: const MainProfileWidget(
                    text: 'تسجيل الخروج',
                  )
              ),
              const DeleteAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
