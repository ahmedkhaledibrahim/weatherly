part of 'curr_condition_cubit.dart';

@immutable
abstract class CurrConditionState {}

class CurrConditionInitial extends CurrConditionState {}

class CurrConditionLoading extends CurrConditionState {}

class CurrConditionLoaded extends CurrConditionState {
  final CurrCondition currCondition;

  CurrConditionLoaded({required this.currCondition});
}

class CurrConditionLoadFailed extends CurrConditionState {
  final String errorMessage;

  CurrConditionLoadFailed({required this.errorMessage});
}
