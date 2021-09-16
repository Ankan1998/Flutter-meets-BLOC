import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class SearchInitState extends SearchState {

}

class SearchLoading extends SearchState {

}

class SearchLoaded extends SearchState{

}

class SearchError extends SearchState{
  
}
