import 'package:leqaa_app/features/home/views/home/models/most_match_accounts_model.dart';
import 'package:leqaa_app/features/home/views/profile/models/hobbies_model.dart';

abstract class HobbiesState {}

class HobbiesInitialState extends HobbiesState {}

class HobbiesLoadingState extends HobbiesState {}

class HobbiesSuccessState extends HobbiesState {
  final HobbiesModel hobbiesModel;
  HobbiesSuccessState({required this.hobbiesModel});
}

class HobbiesFailedState extends HobbiesState {
  final String msg;
  HobbiesFailedState({required this.msg});
}
