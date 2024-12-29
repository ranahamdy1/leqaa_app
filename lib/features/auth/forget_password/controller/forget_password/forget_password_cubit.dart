import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/features/auth/forget_password/controller/forget_password/forget_password_state.dart';
import 'package:leqaa_app/features/auth/forget_password/model/forget_password_model.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  late ForgetPasswordModel forgetPasswordModel;

  Future<void> getForgetPassword({
    required String email,
  }) async {
    emit(ForgetPasswordLoadingState());

    try {
      final data = {
        "email": email,
      };

      final response = await DioHelper.postData(url: Endpoints.forgetPassword, data: data);
      forgetPasswordModel = ForgetPasswordModel.fromJson(response.data);
      if (forgetPasswordModel.status == true) {
        emit(ForgetPasswordSuccessState());
      } else {
        emit(ForgetPasswordFailedState(msg: forgetPasswordModel.message ?? 'forget Password failed'));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        String errorMessage = 'Invalid data provided.';
        if (e.response?.data is Map) {
          errorMessage = e.response?.data['message'] ?? errorMessage;
        }
        emit(ForgetPasswordFailedState(msg: errorMessage));
      } else {
        emit(ForgetPasswordFailedState(msg: 'Exception: ${e.toString()}'));
      }
      print("Sign up error: $e");
    } catch (e) {
      emit(ForgetPasswordFailedState(msg: 'Unexpected error: ${e.toString()}'));
      print("Unexpected error: $e");
    }
  }
}
