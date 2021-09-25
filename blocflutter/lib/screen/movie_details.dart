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
  Widget movie_poster() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
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
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.07,
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

  Widget plot() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          
          child: widget.movie.plot != null
          ? Text(
            widget.movie.plot,
            style: MyTheme.paragraph
          )
          : Text ("Nothing")

        ),
      ),
      decoration: BoxDecoration(
          color: Color(0x33DBEDC5),
          borderRadius: BorderRadius.all(Radius.circular(30))),
    );
  }

  Widget cast() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 15.0);
        },
        itemCount: widget.movie.cast.length,
        itemBuilder: (context,index) {
          return ClipPath(
            child: Container(
              child: Center(
                child: ListTile(
                  title: Column(
                    children: [
                      SizedBox(height:5),
                      Text("${widget.movie.cast[index].actor}",style:MyTheme.heading),
                      Text("AS",style: TextStyle(color: Colors.white)),
                      Text("${widget.movie.cast[index].character}",style:MyTheme.heading)
                    ],
                  )
                  // Text("${widget.movie.cast[index].actor} AS ${widget.movie.cast[index].character}"),
                ),
              ),
              height: 80,
              decoration: BoxDecoration(
                  color: Color(0x802B9BAB),
                  border: Border(
                      left: BorderSide(
                          color: Color(0xffDBEDC5), width: 20))),
            ),
            clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
          );
        }
      ),
    );

  
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(bottom:12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                movie_poster(),
                SizedBox(height: 10),
                Text(
                  widget.movie.title,
                  style: MyTheme.main_heading,
                ),
                StackMovie(
                  moviemodel: widget.movie,
                ),
                SizedBox(height: 5),
                releaseyear(),
                SizedBox(height: 25),
                Text(
                  "PLOT",
                  style: MyTheme.main_heading,
                ),
                SizedBox(height:20),
                plot(),
                SizedBox(height:25),
                Text(
                  "CAST",
                  style: MyTheme.main_heading,
                ),
                SizedBox(height:25),
                cast(),
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}
