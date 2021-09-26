import 'package:blocflutter/bloc/moviebloc/movie_bloc.dart';
import 'package:blocflutter/bloc/moviebloc/movie_event.dart';
import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/model/search_movie_model.dart';
import 'package:blocflutter/repo/movie_details_api.dart';
import 'package:blocflutter/screen/movie_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieGrid extends StatefulWidget {
  const MovieGrid({Key key, this.searchmovie}) : super(key: key);
  final SearchModel searchmovie;

  @override
  _MovieGridState createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(MovieApiRepo()),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: widget.searchmovie.titles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
              onTap: () async {
                BlocProvider.of<MovieBloc>(context)
                    .add(FetchMovie(widget.searchmovie.titles[index].id));
                
                //  very very important note
                // Blocprovider.value to pass context to another screen
                // value should be instance of existing BP --> BlocProvider.of<MovieBloc>(context)
                // context --> context of previous screen;
                // new screen context is underscore
                
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return BlocProvider.value(
                    value: BlocProvider.of<MovieBloc>(context),
                    child: MovieDetails(),
                  );
                }));
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Image.network(widget.searchmovie.titles[index].image,
                    fit: BoxFit.fill),
              ),
            ),
          );
        },
      ),
    );
  }
}
