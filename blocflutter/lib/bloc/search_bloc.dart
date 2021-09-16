import 'package:blocflutter/bloc/search_events.dart';
import 'package:blocflutter/bloc/search_state.dart';
import 'package:blocflutter/model/search_movie_model.dart';
import 'package:blocflutter/repo/search_movie_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchApiRepo searchrepo;

  SearchBloc(this.searchrepo) : super(SearchInitState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchMovie) {
      yield SearchLoading();
      try {
        var search_json = await searchrepo.searchMovie(event.searchx);
        SearchModel search_model = SearchModel.fromJson(search_json);
        yield SearchLoaded(search_model);
      } catch (e) {
        yield SearchError();
      }
    } else if (event is ResetSearch) {
      yield SearchInitState();
    }
  }
}
