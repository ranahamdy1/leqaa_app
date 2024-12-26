import 'package:leqaa_app/features/welcome/on_boarding/models/on_boarding_dio_model.dart';

abstract class OnBoardingDioState {}

class OnBoardingDioInitialState extends OnBoardingDioState {}

class OnBoardingDioLoadingState extends OnBoardingDioState {}

class OnBoardingDioSuccessState extends OnBoardingDioState {
  final OnBoardingDioModel onBoardingDioModel;
  OnBoardingDioSuccessState({required this.onBoardingDioModel});
}

class OnBoardingDioFailedState extends OnBoardingDioState {
  final String msg;
  OnBoardingDioFailedState({required this.msg});
}
