import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchMovie extends SearchEvent {
  final _search;

  SearchMovie(this._search);
  List<Object> get props => [_search];
}

class ResetSearch extends SearchEvent {}
