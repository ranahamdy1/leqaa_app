import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/features/welcome/on_boarding/controller/cubit/on_boarding_dio_state.dart';
import 'package:leqaa_app/features/welcome/on_boarding/models/on_boarding_dio_model.dart';

class OnBoardingDioCubit extends Cubit<OnBoardingDioState> {
  OnBoardingDioCubit() : super(OnBoardingDioInitialState());

  static OnBoardingDioCubit get(context) => BlocProvider.of(context);

  OnBoardingDioModel? onBoardingDioModel;

  void getOnBoarding() {
    emit(OnBoardingDioLoadingState());

    DioHelper.getData(
      url: Endpoints.onBoarding,
    ).then((value) {
      if (value.data != null) {
        onBoardingDioModel = OnBoardingDioModel.fromJson(value.data);
        emit(OnBoardingDioSuccessState(onBoardingDioModel: onBoardingDioModel!));
      } else {
        emit(OnBoardingDioFailedState(msg: 'No data found.'));
      }
    }).catchError((onError) {
      final errorMessage = (onError is DioError)
          ? onError.response?.data['message'] ?? onError.message
          : onError.toString();
      emit(OnBoardingDioFailedState(msg: errorMessage));
      print("errorMessage $errorMessage");
    });
  }
}
