import 'package:leqaa_app/features/home/views/main_profile/models/about_app_model.dart';

abstract class AboutAppState {}

class AboutAppDioInitialState extends AboutAppState {}

class AboutAppLoadingState extends AboutAppState {}

class AboutAppSuccessState extends AboutAppState {
  final AboutAppModel aboutAppModel;
  AboutAppSuccessState({required this.aboutAppModel});
}

class AboutAppStateFailedState extends AboutAppState {
  final String msg;
  AboutAppStateFailedState({required this.msg});
}
