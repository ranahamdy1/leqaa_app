import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/features/home/views/home/controller/most_match_accounts_state.dart';
import 'package:leqaa_app/features/home/views/home/models/most_match_accounts_model.dart';

class MostMatchAcountCubit extends Cubit<MostMatchAccountsState> {
  MostMatchAcountCubit() : super(MostMatchAccountsInitialState());

  static MostMatchAcountCubit get(context) => BlocProvider.of(context);

  MostMatchAcountModel? mostMatchAcountModel;

  void getMostMatchAccounts() {
    emit(MostMatchAccountsLoadingState());

    DioHelper.getData(url: Endpoints.home).then((value) {
      print("API Response: ${value.data}");
      if (value.data != null) {
        mostMatchAcountModel = MostMatchAcountModel.fromJson(value.data);
        emit(MostMatchAccountsSuccessState(mostMatchAcountModel: mostMatchAcountModel!));
      } else {
        emit(MostMatchAccountsFailedState(msg: 'No data found.'));
      }
    }).catchError((onError) {
      print("API Error: $onError");
      final errorMessage = (onError is DioError)
          ? onError.response?.data['message'] ?? onError.message
          : onError.toString();
      emit(MostMatchAccountsFailedState(msg: errorMessage));
    });

  }
}
