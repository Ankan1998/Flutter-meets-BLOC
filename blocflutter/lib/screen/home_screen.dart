import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
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
              SizedBox(
                child: Center(
                  child: Text(
                    'API',
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontFamily: GoogleFonts.aclonica().fontFamily,
                      fontSize: 34.0,
                      letterSpacing: 6,
                      
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
        
      
    );
  }
}