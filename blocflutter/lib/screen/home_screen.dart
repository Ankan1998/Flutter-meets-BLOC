import 'package:blocflutter/bloc/search_bloc.dart';
import 'package:blocflutter/bloc/search_events.dart';
import 'package:blocflutter/bloc/search_state.dart';
import 'package:blocflutter/widgets/movie_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            BlocProvider.of<SearchBloc>(context).add(SearchMovie(widget.myController.text));
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: state is SearchLoading
                    ? Center(child: CircularProgressIndicator())
                    :Flexible(
                        child: state is SearchLoaded
                            ? MovieSlider(searchmovie: state.searchloaded)
                            : Container(height: 200, width: 200)),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
