import 'package:blocflutter/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StackMovie extends StatefulWidget {
  final Moviemodel moviemodel;

  const StackMovie({Key key, this.moviemodel}) : super(key: key);

  @override
  _StackMovieState createState() => _StackMovieState();
}

class _StackMovieState extends State<StackMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 0.12,
        //margin: EdgeInsets.only(top: 110.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.2, 0.4, 0.6, 0.8,0.9],
              colors: [
                Colors.grey[100],
                Colors.purple[100],
                Colors.lime[200],
                Colors.orange[100],
                Colors.green[100],
                Colors.grey[100],
              ],
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Runtime",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      letterSpacing: 1),
                ),
                Text(
                  widget.moviemodel.length,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[600],
                      fontFamily: GoogleFonts.raleway().fontFamily,
                      letterSpacing: 1.5),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rating",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      letterSpacing: 1),
                ),
                Text(
                  widget.moviemodel.rating,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[600],
                      fontFamily: GoogleFonts.raleway().fontFamily,
                      letterSpacing: 1.5),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Votes",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      letterSpacing: 1),
                ),
                Text(
                  widget.moviemodel.ratingVotes,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[600],
                      fontFamily: GoogleFonts.raleway().fontFamily,
                      letterSpacing: 1.5),
                ),
              ],
            ),
          ],
        ),
      );
  }
}