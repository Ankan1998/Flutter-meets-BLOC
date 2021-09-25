import 'package:blocflutter/screen/home_screen.dart';
import 'package:blocflutter/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class SplashScreenx extends StatefulWidget {
  // const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenxState createState() => _SplashScreenxState();
}

class _SplashScreenxState extends State<SplashScreenx> {
  @override  
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen()),
            ));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipOval(
              child: Image.asset(
                "images/movie.png",
                height: 200,
                width: 200,
              ),
            ),
          ),
          SizedBox(height:50.0),
          Text(
            'MOVIEZ NERD',
            style: TextStyle(
              color: Color(0xffC2F2EF),
              fontSize: 32,
              fontFamily: GoogleFonts.revalia().fontFamily
            )
          )
        ],
      )
    );
  }
}