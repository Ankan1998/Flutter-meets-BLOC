import 'dart:developer';

import 'package:blocflutter/bloc/search_bloc.dart';
import 'package:blocflutter/bloc/search_events.dart';
import 'package:blocflutter/bloc/search_state.dart';
import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/model/search_movie_model.dart';
import 'package:blocflutter/repo/search_movie_api.dart';
import 'package:blocflutter/widgets/movie_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  //const HomeScreen({ Key? key }) : super(key: key);
  SearchModel searchmoviemodel;
  bool flag = false;
  TextEditingController myController = TextEditingController();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CupertinoColors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'API',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: GoogleFonts.aclonica().fontFamily,
                        fontSize: 34.0,
                        letterSpacing: 6,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Movie Name'),
                            controller: widget.myController,
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                          ),
                          iconSize: 40,
                          color: Colors.green,
                          onPressed: () async {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            BlocProvider.of<SearchBloc>(context)
                                .add(SearchMovie(widget.myController.text));
                            if (state is SearchLoading) {
                              CircularProgressIndicator();
                            }
                            if (state is SearchLoaded) {
                              widget.flag = true;
                              widget.searchmoviemodel = state.searchloaded;
                              widget.myController.clear();
                              print(widget.searchmoviemodel.titles[0].title);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  // OutlinedButton(
                  //   onPressed: (){
                  //     myController.clear();
                  //   },
                  //   child: Text('Clear')),
                  SizedBox(height: 20),
                  // Flexible(
                  //     child: flag
                  //         ? MovieSlider(searchmovie: searchmoviemodel)
                  //         : Container(height: 200, width: 200))
                  Flexible(
                      child: widget.flag
                          ? CarouselSlider.builder(
                              options: CarouselOptions(
                                  initialPage: 0,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  height:
                                      MediaQuery.of(context).size.height * 0.7),
                              itemCount: widget.searchmoviemodel.titles.length,
                              itemBuilder: (context, index, pindex) {
                                return Image.network(
                                  widget.searchmoviemodel.titles[index].image,
                                  fit: BoxFit.fill,
                                );
                              },
                            )
                          : Container(child:Text('Nothing to show')))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
