import 'package:equatable/equatable.dart';

class MovieEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchMovie extends MovieEvent {
  final movie_id;

  FetchMovie(this.movie_id);
}
