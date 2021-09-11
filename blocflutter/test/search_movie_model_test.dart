import 'dart:convert';
import 'package:blocflutter/model/search_movie_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'search_movie_data.dart';

void main(){

  test('Search movie Model testing from json', () {
    Searchmovie searchmoviemodel = Searchmovie.fromJson(
        json.decode(SearchMovieMockData.GET_SEARCH_MOVIE_RESPONSE)
    );
    expect(searchmoviemodel.titles[0].id, 'tt7286456');
    expect(searchmoviemodel.names[0].id, 'nm0281041');
    expect(searchmoviemodel.companies[1].image, null);
  });

  test('Search Movie Model testing to json', () {
    Searchmovie searchmoviemodel = Searchmovie.fromJson(
        json.decode(SearchMovieMockData.GET_SEARCH_MOVIE_RESPONSE)
    );
    searchmoviemodel.toJson();
    searchmoviemodel.titles.forEach((element) {
      element.toJson();
    });
    searchmoviemodel.names.forEach((element) {
      element.toJson();
    });
    searchmoviemodel.companies.forEach((element) {
      element.toJson();
    });
  });
}