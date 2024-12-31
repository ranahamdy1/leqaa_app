import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/features/home/views/profile/controller/hobby/hobby_state.dart';
import 'package:leqaa_app/features/home/views/profile/models/hobbies_model.dart';

class HobbiesCubit extends Cubit<HobbiesState> {
  HobbiesCubit() : super(HobbiesInitialState());

  static HobbiesCubit get(context) => BlocProvider.of(context);

  HobbiesModel? hobbiesModel;

  void fetchHobbies() {
    emit(HobbiesLoadingState());

    DioHelper.getData(url: Endpoints.hoppies).then((value) {
      print("API Response: ${value.data}");
      if (value.data != null) {
        hobbiesModel = HobbiesModel.fromJson(value.data);
        emit(HobbiesSuccessState(hobbiesModel: hobbiesModel!));
      } else {
        emit(HobbiesFailedState(msg: 'No data found.'));
      }
    }).catchError((onError) {
      print("API Error: $onError");
      final errorMessage = (onError is DioError)
          ? onError.response?.data['message'] ?? onError.message
          : onError.toString();
      emit(HobbiesFailedState(msg: errorMessage));
    });

  }
}

