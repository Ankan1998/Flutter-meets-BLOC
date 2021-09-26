
import 'package:blocflutter/bloc/moviebloc/movie_event.dart';
import 'package:blocflutter/bloc/moviebloc/movie_state.dart';
import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/repo/movie_details_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieApiRepo movierepo;

  MovieBloc(this.movierepo) : super(MovieInitState());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is FetchMovie) {
      yield MovieLoading();
      try {
        var movie_json = await movierepo.getMovieData(event.movie_id);
        Moviemodel Movie_model = Moviemodel.fromJson(movie_json);
        yield MovieLoaded(Movie_model);
      } catch (e) {
        yield MovieError();
      }
    }
  }
}
