part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchEmpty extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {}
class SearchFailed extends SearchState {
  final String errorMessage;
  SearchFailed({required this.errorMessage});
}

