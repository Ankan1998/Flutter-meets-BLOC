import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchMovie extends SearchEvent {
  final searchx;

  SearchMovie(this.searchx);
  List<Object> get props => [searchx];

}

class ResetSearch extends SearchEvent {}
