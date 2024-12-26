import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leqaa_app/core/helper/dio_helper.dart';
import 'package:leqaa_app/core/utils/app_end_points.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/app_rules/controller/app_rules_state.dart';
import 'package:leqaa_app/features/auth/sign_up/views/app_rules/app_rules/models/app_rules_model.dart';

class AppRulesCubit extends Cubit<AppRulesState> {
  AppRulesCubit() : super(AppRulesInitialState());

  static AppRulesCubit get(context) => BlocProvider.of(context);

  AppRulesModel? appRulesModel;

  void getRules() {
    emit(AppRulesLoadingState());

    DioHelper.getData(
      url: Endpoints.termsAndConditions,
      lang: 'en'
    ).then((value) {
      if (value.data != null) {
        appRulesModel = AppRulesModel.fromJson(value.data);
        emit(AppRulesSuccessState(appRulesModel: appRulesModel!));
      } else {
        emit(AppRulesFailedState(msg: 'No data found.'));
      }
    }).catchError((onError) {
      final errorMessage = (onError is DioError)
          ? onError.response?.data['message'] ?? onError.message
          : onError.toString();
      emit(AppRulesFailedState(msg: errorMessage));
      print("errorMessage $errorMessage");
    });
  }
}
