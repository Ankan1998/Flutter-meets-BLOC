import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchInitState extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final _searchloaded;

  SearchLoaded(this._searchloaded);
  List<Object> get props => [_searchloaded];

}

class SearchError extends SearchState {}
