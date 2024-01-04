import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherly/repositories/cityRepo.dart';

import '../models/city.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final CityRepo cityRepo;
  List<City> searchList = [];

  SearchCubit(this.cityRepo) : super(SearchEmpty());

  Future<void> searchCity(String city) async {
    try {
      emit(SearchLoading());
      searchList = await cityRepo.getCityAutoComplete(city);
      print(searchList.length);
      if (searchList.isNotEmpty) {
        emit(SearchLoaded());
      } else {
        emit(SearchEmpty());
      }
    } catch (e) {
      emit(SearchFailed(errorMessage: e.toString()));
    }
  }
}
