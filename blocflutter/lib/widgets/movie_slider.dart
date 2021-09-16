import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/model/search_movie_model.dart';
import 'package:blocflutter/repo/movie_details_api.dart';
import 'package:blocflutter/screen/movie_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({Key key, this.searchmovie}) : super(key: key);
  final SearchModel searchmovie;

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  Moviemodel moviemodel;
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
        return InkWell(
          child: Image.network(
            widget.searchmovie.titles[index].image,
            fit: BoxFit.fill,
          ),
          onTap: () async {
            final mr = new MovieApiRepo(movie_id: widget.searchmovie.titles[index].id);
            var m = await mr.getMovieData();
            Moviemodel moviemodel = Moviemodel.fromJson(m);
            print(moviemodel.plot);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return MovieDetails(movie: moviemodel);
              })
            );
          },
        );
      },
    );
  }
}
