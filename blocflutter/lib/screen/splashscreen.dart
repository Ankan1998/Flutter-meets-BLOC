import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenx extends StatefulWidget {
  // const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenxState createState() => _SplashScreenxState();
}

class _SplashScreenxState extends State<SplashScreenx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipOval(
              child: Image.asset(
                "images/s.jpeg",
                height: 220,
                width: 220,
              ),
            ),
          ),
          SizedBox(height:50.0),
          Text(
            'API',
            style: TextStyle(
              fontFamily: GoogleFonts.lato().fontFamily,
              fontSize: 34,
              color: Colors.teal[800],
              letterSpacing: 4,
            ),
          )
        ],
      )
    );
  }
}