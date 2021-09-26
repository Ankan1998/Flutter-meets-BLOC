import 'package:blocflutter/bloc/moviebloc/movie_bloc.dart';
import 'package:blocflutter/bloc/moviebloc/movie_state.dart';
import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/themes.dart';
import 'package:blocflutter/widgets/stack_movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  Widget movie_poster(String poster_url) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width * 1.0,
        child: Image.network(
          poster_url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget releaseyear(String ryear) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: Color(0x332B9BAB),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Center(
        child: Text(
          "Release Year: ${ryear}",
          style: MyTheme.heading,
        ),
      ),
    );
  }

  Widget plot(String mplot) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
            child: mplot != null
                ? Text(mplot, style: MyTheme.paragraph)
                : Text("Nothing")),
      ),
      decoration: BoxDecoration(
          color: Color(0x33DBEDC5),
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }

  Widget cast(List<Cast> cast) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 15.0);
          },
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: cast.length,
          itemBuilder: (context, index) {
            return ClipPath(
              child: Container(
                child: Center(
                  child: ListTile(
                    title: Column(
                      children: [
                        SizedBox(height: 2.5),
                        Text("${cast[index].actor}",
                            style: MyTheme.heading),
                        Text("as", style: MyTheme.heading),
                        Text("${cast[index].character}",
                            style: MyTheme.heading)
                      ],
                    )
                  ),
                ),
                height: 80,
                decoration: BoxDecoration(
                    color: Color(0x802B9BAB),
                    border: Border(
                        left: BorderSide(color: Color(0xffDBEDC5), width: 20))),
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoaded) {
          Moviemodel movie = state.movieloaded;
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      movie_poster(movie.poster),
                      SizedBox(height: 10),
                      Text(
                        movie.title,
                        style: MyTheme.main_heading,
                      ),
                      StackMovie(
                        moviemodel: movie,
                      ),
                      SizedBox(height: 5),
                      releaseyear(movie.year),
                      SizedBox(height: 25),
                      Text(
                        "PLOT",
                        style: MyTheme.main_heading,
                      ),
                      SizedBox(height: 20),
                      plot(movie.plot),
                      SizedBox(height: 25),
                      Text(
                        "CAST",
                        style: MyTheme.main_heading,
                      ),
                      SizedBox(height: 25),
                      cast(movie.cast),
                    ],
                  ),
                ),
              ),
            ),
        );
        }
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height:30),
                Text(
                  "Loading Movie Please wait...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22
                  )
                )
              ],
            ),
          )
        );

      },
    );
  }
}
