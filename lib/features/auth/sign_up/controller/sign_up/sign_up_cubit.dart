import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:leqaa_app/core/helper/cache_helper.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/core/utils/app_strings.dart';
import 'package:leqaa_app/features/auth/sign_up/controller/sign_up/sign_up_state.dart';
import 'package:leqaa_app/features/auth/sign_up/models/sign_up_model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  late SignUpModel signUpModel;

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

  Future<void> signUp({
    required String name,
    required String email,
    required String birth_date,
    required String password,
    required String password_confirmation,
    required String terms_conditions,
  }) async {
    emit(SignUpLoadingState());

    try {
      final deviceId = await _getDeviceId();
      final firebaseToken = await FirebaseMessaging.instance.getToken() ?? 'unknown_firebase_token';

      final data = {
        "name": name,
        "email": email,
        "birth_date": birth_date,
        "password": password,
        "password_confirmation": password_confirmation,
        "terms_conditions": terms_conditions,
        "device_id": deviceId,
        "firebase_token": firebaseToken,
      };

      final response = await DioHelper.postData(url: Endpoints.signUp, data: data);
      signUpModel = SignUpModel.fromJson(response.data);
      if (signUpModel.status == true) {
        CacheHelper.saveData(key: AppStrings.token, value: signUpModel.data?.token ?? '');
        emit(SignUpSuccessState());
      } else {
        emit(SignUpFailedState(msg: signUpModel.message ?? 'Sign up failed'));
      }
    } on DioException catch (e) {
      // Handle DioException specifically
      if (e.response?.statusCode == 422) {
        // Extract detailed error message for 422 status code
        String errorMessage = 'Invalid data provided.';
        if (e.response?.data is Map) {
          errorMessage = e.response?.data['message'] ?? errorMessage;
        }
        emit(SignUpFailedState(msg: errorMessage)); // Pass the error message to the UI
      } else {
        emit(SignUpFailedState(msg: 'Exception: ${e.toString()}'));
      }
      print("Sign up error: $e");
    } catch (e) {
      // Handle general errors (non-Dio exceptions)
      emit(SignUpFailedState(msg: 'Unexpected error: ${e.toString()}'));
      print("Unexpected error: $e");
    }
  }
}
