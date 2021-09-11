import 'package:blocflutter/model/search_movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({Key key, this.searchmovie}) : super(key: key);
  final Searchmovie searchmovie;

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 25.0);
      },
      scrollDirection: Axis.horizontal,
      itemCount: widget.searchmovie.titles.length,
      itemBuilder: (context, index) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.searchmovie.titles[index].title,
                style: TextStyle(
                    fontSize: 88.0,
                    color: Colors.grey[100]
                ),
              )
            ],
        );

      },
    );
  }
}
