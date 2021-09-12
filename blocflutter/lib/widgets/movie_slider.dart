import 'package:blocflutter/model/search_movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({Key key, this.searchmovie}) : super(key: key);
  final Searchmovie searchmovie;

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(

      options: CarouselOptions(
        initialPage: 0,
        enlargeCenterPage: true,
        autoPlay: true,
        height: MediaQuery.of(context).size.height * 0.7
      ),
      itemCount: widget.searchmovie.titles.length,
      itemBuilder: (context, index,pindex) {
        // print(widget.searchmovie.titles[index].title);
        // return FittedBox(
        //   fit: BoxFit.fill,
        //   child: Image.network(
        //     widget.searchmovie.titles[index].image,
        //
        //   )
        return Image.network(
          widget.searchmovie.titles[index].image,
          fit: BoxFit.fill,

        );

      },
    );
  }
}
