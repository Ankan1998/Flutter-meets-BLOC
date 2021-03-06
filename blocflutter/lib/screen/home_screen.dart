import 'package:blocflutter/bloc/moviebloc/movie_bloc.dart';
import 'package:blocflutter/bloc/searchbloc/search_bloc.dart';
import 'package:blocflutter/bloc/searchbloc/search_events.dart';
import 'package:blocflutter/bloc/searchbloc/search_state.dart';
import 'package:blocflutter/repo/movie_details_api.dart';
import 'package:blocflutter/themes.dart';
import 'package:blocflutter/widgets/movie_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blocflutter/repo/search_movie_api.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({ Key? key }) : super(key: key);
  TextEditingController myController = TextEditingController();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final myController = TextEditingController()

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(SearchApiRepo())
        ),
        BlocProvider(
          create: (context) => MovieBloc(MovieApiRepo())
        )
      ],
      
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                backgroundColor: MyTheme.kPrimaryColorHeader,
                centerTitle: true,
                title: Text(
                  'MOVIEZ NERD',
                  style: MyTheme.kAppTitle
                )
              ),
              body: Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35.0),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration.collapsed(
                                        hintText: "Enter Movie Name...",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[500],
                                          fontFamily: GoogleFonts.satisfy().fontFamily,
                                          letterSpacing: 2.0,
                                          fontSize: 18.0,
                                        ),
                                        border: InputBorder.none),
                                    controller: widget.myController,
                                  ),
                                ),
                                SizedBox(width: 0, height: 50)
                              ],
                            ),
                          ),
                          SizedBox(width: 10),              
                          IconButton(
                            icon: Icon(
                              Icons.search_outlined
                            ),
                            iconSize: 40,
                            color: Color(0xffD2C5ED),
                            onPressed: () async {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                        
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              BlocProvider.of<SearchBloc>(context)
                                  .add(SearchMovie(widget.myController.text));
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        // height: MediaQuery.of(context).size.height * 0.2,
                        padding: EdgeInsets.only(top: 12, left:10,right:10,bottom:15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: state is SearchLoading
                              ? Column(
                                children: [
                                  Center(
                                    child: CircularProgressIndicator()
                                  ),
                                  SizedBox(height:30),
                                  Center(
                                    child: Text(
                                      "Loading Please Wait...."
                                    )
                                  )
                                ],
                              )
                              : state is SearchLoaded
                                      ? MovieGrid(searchmovie: state.searchloaded)
                                      : Container(height: 200, width: 200),
                      ),
                    ),
                    SizedBox(height:25)
                    
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
