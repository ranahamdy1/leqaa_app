import 'package:leqaa_app/features/auth/sign_up/views/app_rules/app_rules/models/app_rules_model.dart';

abstract class AppRulesState {}

class AppRulesInitialState extends AppRulesState {}

class AppRulesLoadingState extends AppRulesState {}

class AppRulesSuccessState extends AppRulesState {
  final AppRulesModel appRulesModel;
  AppRulesSuccessState({required this.appRulesModel});
}

class AppRulesFailedState extends AppRulesState {
  final String msg;
  AppRulesFailedState({required this.msg});
}
