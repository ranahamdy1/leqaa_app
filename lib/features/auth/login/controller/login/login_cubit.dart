import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:leqaa_app/core/helper/cache_helper.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/core/utils/app_strings.dart';
import 'package:leqaa_app/features/auth/login/controller/login/login_state.dart';
import 'package:leqaa_app/features/auth/login/model/login_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  // Helper method to get device ID
  Future<String?> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    String? id;

    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        id = androidInfo.id ?? 'unknown_device_id';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        id = iosInfo.identifierForVendor ?? 'unknown_device_id';
      }
    } catch (e) {
      print("Error getting device ID: $e");
      return 'unknown_device_id';
    }

    return id;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final deviceId = await _getDeviceId();
      final firebaseToken = await FirebaseMessaging.instance.getToken() ?? 'unknown_firebase_token';

      final data = {
        "email": email,
        "password": password,
        "device_id": deviceId,
        "firebase_token": firebaseToken,
      };

      final response = await DioHelper.postData(url: Endpoints.login, data: data);
      loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status == true) {
        CacheHelper.saveData(key: AppStrings.token, value: loginModel.data?.token ?? '');
        emit(LoginSuccessState());
      } else {
        emit(LoginFailedState(msg: loginModel.message ?? 'Login up failed'));
      }
    } on DioException catch (e) {
      // Handle DioException specifically
      if (e.response?.statusCode == 422) {
        // Extract detailed error message for 422 status code
        String errorMessage = 'Invalid data provided.';
        if (e.response?.data is Map) {
          errorMessage = e.response?.data['message'] ?? errorMessage;
        }
        emit(LoginFailedState(msg: errorMessage)); // Pass the error message to the UI
      } else {
        emit(LoginFailedState(msg: 'Exception: ${e.toString()}'));
      }
      print("Sign up error: $e");
    } catch (e) {
      // Handle general errors (non-Dio exceptions)
      emit(LoginFailedState(msg: 'Unexpected error: ${e.toString()}'));
      print("Unexpected error: $e");
    }
  }
}
