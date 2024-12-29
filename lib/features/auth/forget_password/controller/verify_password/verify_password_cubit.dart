import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/features/auth/forget_password/controller/verify_password/verify_password_state.dart';
import 'package:leqaa_app/features/auth/forget_password/model/verify_password_model.dart';

class VerifyPasswordCubit extends Cubit<VerifyPasswordStates> {
  VerifyPasswordCubit() : super(VerifyPasswordInitial());
  static VerifyPasswordCubit get(context) => BlocProvider.of(context);

  late VerifyPasswordModel verifyPasswordModel;

  // Constants
  static const String unknownDeviceId = 'unknown_device_id';
  static const String defaultErrorMessage = 'An unexpected error occurred. Please try again later.';

  // Helper method to get device ID
  Future<String> _getDeviceId() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id ?? unknownDeviceId;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ?? unknownDeviceId;
      }
    } catch (e) {
      print("Error getting device ID: $e");
    }
    return unknownDeviceId;
  }

  Future<void> getVerifyPassword({
    required String email,
    required String code,
  }) async {
    emit(VerifyPasswordLoadingState());

    try {
      final deviceId = await _getDeviceId();

      final data = {
        "email": email,
        "code": code,
        "device_id": deviceId,
      };

      final response = await DioHelper.postData(url: Endpoints.verify, data: data);
      verifyPasswordModel = VerifyPasswordModel.fromJson(response.data as Map<String, dynamic>);

      if (verifyPasswordModel.status == true) {
        print('Verification successful: ${verifyPasswordModel.toJson()}');
        emit(VerifyPasswordSuccessState());
      } else {
        emit(VerifyPasswordFailedState(msg: verifyPasswordModel.message ?? 'Verification failed.'));
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] ?? defaultErrorMessage;
      emit(VerifyPasswordFailedState(msg: errorMessage));
      print("Dio error: $e");
    } catch (e) {
      emit(VerifyPasswordFailedState(msg: defaultErrorMessage));
      print("Unexpected error: $e");
    }
  }
}
