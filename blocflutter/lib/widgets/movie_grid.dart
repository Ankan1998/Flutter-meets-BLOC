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
    return SingleChildScrollView(
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.9,
        // height: MediaQuery.of(context).size.height * 0.95,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            
          ),
          itemCount: widget.searchmovie.titles.length,
          itemBuilder: (context, index) {
            return Image.network(
              widget.searchmovie.titles[index].image,  
              // height: MediaQuery.of(context).size.height * 0.5,
              // width:MediaQuery.of(context).size.width * 0.2, 
              fit: BoxFit.fill
            );
          },
        ),
      ),
    );
  }
}

