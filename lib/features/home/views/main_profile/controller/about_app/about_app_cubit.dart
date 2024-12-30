import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/features/home/views/main_profile/controller/about_app/about_app_state.dart';
import 'package:leqaa_app/features/home/views/main_profile/models/about_app_model.dart';

class AboutAppCubit extends Cubit<AboutAppState> {
  AboutAppCubit() : super(AboutAppDioInitialState());

  static AboutAppCubit get(context) => BlocProvider.of(context);

  AboutAppModel? aboutAppModel;

  void getAboutApp() {
    emit(AboutAppLoadingState());

    DioHelper.getData(
      url: Endpoints.aboutapp,
    ).then((value) {
      if (value.data != null) {
        aboutAppModel = AboutAppModel.fromJson(value.data);
        emit(AboutAppSuccessState(aboutAppModel: aboutAppModel!));
      } else {
        emit(AboutAppStateFailedState(msg: 'No data found.'));
      }
    }).catchError((onError) {
      final errorMessage = (onError is DioError)
          ? onError.response?.data['message'] ?? onError.message
          : onError.toString();
      emit(AboutAppStateFailedState(msg: errorMessage));
      print("errorMessage $errorMessage");
    });
  }
}
