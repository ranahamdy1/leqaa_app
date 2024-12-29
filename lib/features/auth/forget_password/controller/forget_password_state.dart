abstract class ForgetPasswordStates {}

class ForgetPasswordInitial extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {}

class ForgetPasswordSuccessState extends ForgetPasswordStates {}

class ForgetPasswordFailedState extends ForgetPasswordStates {
  final String msg;
  ForgetPasswordFailedState({required this.msg});
}