import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/utils/app_assets.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/core/widgets/text_widget.dart';
import 'package:leqaa_app/features/auth/login/views/login_screen.dart';
import 'package:leqaa_app/features/home/views/main_profile/controller/log_out/log_out_cubit.dart';
import 'package:leqaa_app/features/home/views/main_profile/controller/log_out/log_out_state.dart';

class SignOutWidget extends StatelessWidget {
  const SignOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutCubit(),
      child: BlocConsumer<LogOutCubit, LogOutState>(
        listener: (context, state) {
          if (state is LogOutSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Logged out successfully!"),
                backgroundColor: Colors.green,
              ),
            );
            // Navigate to login screen after successful logout
            AppRoutes.routeTo(context, const LoginScreen());
          } else if (state is LogOutFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: AppColors.whiteColor,
            contentPadding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("sign_out".getPngAsset),
                      const TextWidget.bigText("تسجيل خروج"),
                      const TextWidget.smallText("هل تريد بالفعل تسجيل الخروج من التطبيق"),
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              CustomButtonWidget(
                "نعم",
                color: AppColors.whiteColor,
                backgroundColor: AppColors.pageControllerColor,
                borderColor: AppColors.pageControllerColor,
                width: 111,
                onPressed: () {
                  LogOutCubit.get(context).logOut();
                },
              ),
              CustomButtonWidget(
                "إلغاء",
                color: AppColors.whiteColor,
                backgroundColor: AppColors.secondColor,
                borderColor: AppColors.secondColor,
                width: 111,
                onPressed: () {
                  AppRoutes.pop(context);
                },
              ),
            ],
            titlePadding: const EdgeInsets.only(right: 10, top: 10),
            title: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
