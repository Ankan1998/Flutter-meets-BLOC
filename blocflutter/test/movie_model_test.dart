import 'dart:convert';

import 'package:blocflutter/model/apimodel.dart';
import 'package:flutter_test/flutter_test.dart';

import 'movie_data.dart';

void main(){

  test('Model testing from json', () {
    Moviemodel moviemodel = Moviemodel.fromJson(
        json.decode(MovieMockData.GET_MOVIE_RESPONSE)
    );
    expect(moviemodel.id, 'tt1375666');
    expect(moviemodel.trailer.id, 'vi4219471385');
  });

  test('Model testing to json', () {
    Moviemodel moviemodel = Moviemodel.fromJson(
        json.decode(MovieMockData.GET_MOVIE_RESPONSE)
    );
    moviemodel.toJson();
    moviemodel.trailer.toJson();
    moviemodel.cast.forEach((element) {
      element.toJson();
    });
  });
}