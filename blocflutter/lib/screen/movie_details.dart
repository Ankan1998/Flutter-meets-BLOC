import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/widgets/stack_movie_detail.dart';
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
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.movie.title),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1.0,
                  
                  child: Image.network(
                    widget.movie.poster,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              StackMovie(moviemodel: widget.movie,),
            ],
          )
        ),
      ),
    );
  }
}
