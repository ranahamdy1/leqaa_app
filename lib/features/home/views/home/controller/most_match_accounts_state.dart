import 'package:leqaa_app/features/home/views/home/models/most_match_accounts_model.dart';

abstract class MostMatchAccountsState {}

class MostMatchAccountsInitialState extends MostMatchAccountsState {}

class MostMatchAccountsLoadingState extends MostMatchAccountsState {}

class MostMatchAccountsSuccessState extends MostMatchAccountsState {
  final MostMatchAcountModel mostMatchAcountModel;
  MostMatchAccountsSuccessState({required this.mostMatchAcountModel});
}

class MostMatchAccountsFailedState extends MostMatchAccountsState {
  final String msg;
  MostMatchAccountsFailedState({required this.msg});
}
