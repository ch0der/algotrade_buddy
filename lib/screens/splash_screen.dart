import 'package:algotrade_buddy/library.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: body(),
    );
  }
  Widget body(){
    return Center(
      child: Container(
        child: TyperAnimatedTextKit(
          isRepeatingAnimation: false,
          onFinished: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstAlgo()));
          },
          speed: Duration(milliseconds: 100),
          text: [". . . . . . . . . . ."],
          textStyle: TextStyle(fontFamily: 'Alatsi',fontSize: 40,color: Colors.green[500]),

        ),


      ),
    );

  }
}
