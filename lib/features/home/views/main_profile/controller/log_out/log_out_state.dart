import 'package:leqaa_app/features/home/views/main_profile/models/log_out_model.dart';

abstract class LogOutState {}

class LogOutInitialState extends LogOutState {}

class LogOutLoadingState extends LogOutState {}

class LogOutSuccessState extends LogOutState {
  final LogOutModel logOutModel;
  LogOutSuccessState({required this.logOutModel});
}

class LogOutFailedState extends LogOutState {
  final String msg;
  LogOutFailedState({required this.msg});
}
