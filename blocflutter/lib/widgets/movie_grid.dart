import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/model/search_movie_model.dart';
import 'package:blocflutter/repo/movie_details_api.dart';
import 'package:blocflutter/screen/movie_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MovieGrid extends StatefulWidget {
  const MovieGrid({Key key, this.searchmovie}) : super(key: key);
  final SearchModel searchmovie;

  @override
  _MovieGridState createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  Moviemodel moviemodel;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        
      ),
      itemCount: widget.searchmovie.titles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Image.network(
              widget.searchmovie.titles[index].image,   
              fit: BoxFit.fill
            ),
          ),
        );
      },
    );
  }
}

