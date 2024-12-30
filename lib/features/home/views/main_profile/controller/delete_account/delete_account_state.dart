import 'package:leqaa_app/features/home/views/main_profile/models/log_out_model.dart';

abstract class DeleteAccountState {}

class DeleteAccountInitialState extends DeleteAccountState {}

class DeleteAccountLoadingState extends DeleteAccountState {}

class DeleteAccountSuccessState extends DeleteAccountState {
  final LogOutModel logOutModel;
  DeleteAccountSuccessState({required this.logOutModel});
}

class DeleteAccountFailedState extends DeleteAccountState {
  final String msg;
  DeleteAccountFailedState({required this.msg});
}
