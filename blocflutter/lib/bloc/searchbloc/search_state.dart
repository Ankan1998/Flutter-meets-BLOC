import 'package:blocflutter/model/search_movie_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchInitState extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final searchloaded;

  SearchLoaded(this.searchloaded);
  
}

class SearchError extends SearchState {}
