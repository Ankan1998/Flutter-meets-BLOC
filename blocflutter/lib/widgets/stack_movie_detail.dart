import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/themes.dart';
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 0.12,
          //margin: EdgeInsets.only(top: 110.0),
          decoration: BoxDecoration(
            color: Color(0xff5D3AC2),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            // border: Border.all(color: Colors.white, width: 3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Runtime",
                    style: MyTheme.heading,
                  ),
                  Text(
                    widget.moviemodel.length,
                    style: MyTheme.heading,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rating",
                    style: MyTheme.heading,
                  ),
                  Text(
                    widget.moviemodel.rating,
                    style: MyTheme.heading,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Votes",
                    style: MyTheme.heading,
                  ),
                  Text(
                    widget.moviemodel.ratingVotes,
                    style: MyTheme.heading,
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}