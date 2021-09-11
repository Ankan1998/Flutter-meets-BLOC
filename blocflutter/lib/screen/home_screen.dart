import 'dart:developer';

import 'package:blocflutter/model/movie_model.dart';
import 'package:blocflutter/repo/apirepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  final ar = new Apirepo();

  //const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.inactiveGray,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'API',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontFamily: GoogleFonts.aclonica().fontFamily,
                    fontSize: 34.0,
                    letterSpacing: 6,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  onSurface: Colors.red,
                ),
                onPressed: () async {
                  var a = await widget.ar.searchMovie();

                  log(a);
                },
                child: Text('TextButton'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
