abstract class ResetPasswordStates {}

class ResetPasswordInitial extends ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates {}

class ResetPasswordFailedState extends ResetPasswordStates {
  final String msg;
  ResetPasswordFailedState({required this.msg});
}