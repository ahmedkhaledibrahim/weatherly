import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherly/models/currCondition.dart';

import '../repositories/currConditionRepo.dart';

part 'curr_condition_state.dart';

class CurrConditionCubit extends Cubit<CurrConditionState> {
  final CurrConditionRepo conditionRepo;

  CurrConditionCubit(this.conditionRepo) : super(CurrConditionInitial());

  Future<void> getCurrentCondition(String locationKey) async {
    emit(CurrConditionLoading());
    try {
      final curr = await conditionRepo.getCurrCondition(locationKey);
      emit(CurrConditionLoaded(currCondition: curr));
    } catch (e) {
      emit(CurrConditionLoadFailed(errorMessage: e.toString()));
    }
  }
}
