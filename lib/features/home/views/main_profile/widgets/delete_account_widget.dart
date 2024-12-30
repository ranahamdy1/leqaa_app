import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/utils/app_colors.dart';
import 'package:leqaa_app/core/utils/app_routes.dart';
import 'package:leqaa_app/core/widgets/custom_button_widget.dart';
import 'package:leqaa_app/features/auth/sign_up/views/sign_up/sign_up_screen.dart';
import 'package:leqaa_app/features/home/views/main_profile/controller/delete_account/delete_account_cubit.dart';
import 'package:leqaa_app/features/home/views/main_profile/controller/delete_account/delete_account_state.dart';

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountCubit(),
      child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
          listener: (context, state) {
            if (state is DeleteAccountSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Account deleted successfully!"),
                  backgroundColor: Colors.green,
                ),
              );
              AppRoutes.routeTo(context, const SignUpScreen());
            } else if (state is DeleteAccountFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(  // Pass the dynamic error message
                  content: Text(state.msg ?? "Delete account failed!"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is DeleteAccountLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: CustomButtonWidget(
                "حذف الحساب",
                width: double.infinity,
                color: AppColors.secondColor,
                borderColor: AppColors.secondColor,
                backgroundColor: AppColors.whiteColor,
                onPressed: () {
                  // Disable button during loading state
                  if (state is DeleteAccountLoadingState) {
                    return;
                  }
                  DeleteAccountCubit.get(context).deleteAccount();
                },
              ),
            );
          }
      ),
    );
  }
}
