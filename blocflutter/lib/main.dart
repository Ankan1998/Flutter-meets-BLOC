import 'package:blocflutter/bloc/search_bloc.dart';
import 'package:blocflutter/repo/search_movie_api.dart';
import 'package:blocflutter/screen/home_screen.dart';
import 'package:blocflutter/screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => SearchBloc(SearchApiRepo()),
        child: HomeScreen(),
      ),
    );
  }
}
