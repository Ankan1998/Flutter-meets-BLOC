import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class MovieInitState extends MovieState {

}

class MovieLoading extends MovieState {

}

class MovieLoaded extends MovieState{
  final movieloaded;

  MovieLoaded(this.movieloaded);
}

class MovieError extends MovieState{
  
}
