import 'package:blocflutter/model/movie_model.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key key, this.movie}) : super(key: key);
  final Moviemodel movie;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        widget.movie.plot,
        style: TextStyle(
          color:Colors.black
        ),
      ),
    );
  }
}
