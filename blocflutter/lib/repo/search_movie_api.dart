import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchApiRepo {

  SearchApiRepo({this.search_val});
  final String search_val;

  Future<dynamic> searchMovie() async {
    Map<String, String> requestHeaders = {
      'x-rapidapi-host':
      'imdb-internet-movie-database-unofficial.p.rapidapi.com',
      'x-rapidapi-key': 'f525b2fab4mshdbb0c7c17eac930p1273efjsna765b0e6eb9e',
    };

    http.Response response = await http.get(
        Uri.parse(
            'https://imdb-internet-movie-database-unofficial.p.rapidapi.com/search/$search_val'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print("Error in Fetching Data");
    }
  }
}


