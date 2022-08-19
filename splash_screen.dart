import 'dart:async';
import 'package:zchat/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    startTimer();
  }

  startTimer () async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, loginRoute);
  }

  loginRoute()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder:(context)  => LoginScreen()

    ));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
  Widget initWidget()
  {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: new Color(0xffF5591F),
                gradient: LinearGradient(
                    colors: [(new Color(0xf1F5591F)),(new Color(0xffF2861E))],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          Center(
            child:Container(
              margin: EdgeInsets.only(top: 50,left: 20),
              child: Image.asset("images/logo.png"),
              height: 250,
              width: 250,
            ) ,
          )
        ],
      ),
    );
  }
}
