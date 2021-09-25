import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/themes.dart';
import 'package:blocflutter/widgets/stack_movie_detail.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key key, this.movie}) : super(key: key);
  final Moviemodel movie;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  Widget movie_poster(){
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 1.0,
        child: Image.network(
          widget.movie.poster,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget releaseyear() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Color(0x332B9BAB),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Center(
        child: Text(
          "Release Year: ${widget.movie.year}",
          style: MyTheme.heading,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            movie_poster(),
            StackMovie(
              moviemodel: widget.movie,
            ),
            SizedBox(height: 5),
            releaseyear(),
          ],
        )),
      ),
    );
  }
}
