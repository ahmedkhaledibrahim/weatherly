import 'package:weatherly/constants.dart';
import 'package:weatherly/domain/currentconditionApi_services.dart';

import '../models/currCondition.dart';

class CurrConditionRepo {
  final CurrentConditionApiServices currentConditionApiServices;

  CurrConditionRepo({required this.currentConditionApiServices});

  Future<CurrCondition> getCurrCondition(String locationKey) async {
    final curr = await currentConditionApiServices.getCurrCondition(
        getApiKey(), locationKey);
    return curr[0];
  }
}
