import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/helper/cache_helper.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/core/utils/app_strings.dart';
import 'package:leqaa_app/features/home/views/main_profile/controller/delete_account/delete_account_state.dart';
import 'package:leqaa_app/features/home/views/main_profile/models/log_out_model.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitialState());

  static DeleteAccountCubit get(context) => BlocProvider.of(context);

  LogOutModel? logOutModel;

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoadingState());

    try {
      final value = await DioHelper.getData(url: Endpoints.deleteAcount);

      if (value.data['status'] == true) {
        logOutModel = LogOutModel.fromJson(value.data);

        bool tokenRemoved = await CacheHelper.removeData(key: AppStrings.token);
        if (!tokenRemoved) {
          emit(DeleteAccountFailedState(msg: 'Failed to remove token from cache.'));
          return;
        }

        emit(DeleteAccountSuccessState(logOutModel: logOutModel!));
      } else {
        emit(DeleteAccountFailedState(msg: 'Account deletion failed. Invalid response from server.'));
      }
    } catch (onError) {
      String errorMessage;

      if (onError is DioException) {
        switch (onError.type) {
          case DioExceptionType.connectionTimeout:
            errorMessage = "Connection timeout. Please try again.";
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage = "Server is taking too long to respond.";
            break;
          case DioExceptionType.badResponse:
            if (onError.response?.statusCode == 422) {
              errorMessage = 'Invalid data provided.';
              if (onError.response?.data is Map) {
                errorMessage = onError.response?.data['message'] ?? errorMessage;
              }
            } else {
              errorMessage = onError.response?.data['message'] ?? "Unexpected server error.";
            }
            break;
          case DioExceptionType.cancel:
            errorMessage = "Request was cancelled.";
            break;
          case DioExceptionType.unknown:
            errorMessage = "Network error. Please check your connection.";
            break;
          default:
            errorMessage = "An unexpected error occurred.";
            break;
        }
      } else {
        errorMessage = "An unexpected error occurred.";
      }

      emit(DeleteAccountFailedState(msg: errorMessage));
      print("Error: $errorMessage");
    }
  }
}
