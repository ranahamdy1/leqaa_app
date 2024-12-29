abstract class VerifyPasswordStates {}

class VerifyPasswordInitial extends VerifyPasswordStates {}

class VerifyPasswordLoadingState extends VerifyPasswordStates {}

class VerifyPasswordSuccessState extends VerifyPasswordStates {}

class VerifyPasswordFailedState extends VerifyPasswordStates {
  final String msg;
  VerifyPasswordFailedState({required this.msg});
}