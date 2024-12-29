abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpFailedState extends SignUpStates {
  final String msg;
  SignUpFailedState({required this.msg});
}