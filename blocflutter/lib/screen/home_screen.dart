import 'dart:developer';

import 'package:blocflutter/bloc/search_bloc.dart';
import 'package:blocflutter/bloc/search_events.dart';
import 'package:blocflutter/bloc/search_state.dart';
import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/model/search_movie_model.dart';
import 'package:blocflutter/repo/search_movie_api.dart';
import 'package:blocflutter/widgets/movie_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {

  SearchModel searchmoviemodel;
  bool flag = false;
  //const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      width:MediaQuery.of(context).size.width * 0.75,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Movie Name'
                        ),
                        controller: myController,
                      ),
                    ),
                    SizedBox(width:10),
                    BlocBuilder<SearchBloc, SearchState>(
                      builder: (BuildContext context, SearchState state) {
                      if (state is SearchLoaded) {
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
                            context
                                .read<SearchBloc>()
                                .add(SearchMovie(myController.text));
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    })

                  ],
                ),
              ),
              SizedBox(height:20),
              Flexible(
                child: widget.flag
                    ? MovieSlider(searchmovie: widget.searchmoviemodel)
                    : Container(height:200,width:200)
              )
            ],
          ),
        ),
      ),
    );
  }
}
