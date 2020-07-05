import 'dart:async';
import 'package:quiz_app/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    timerFunction();
    super.initState();
  }

  void timerFunction() {
    Timer(
        Duration(seconds: 2),
        () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/splash.jpg"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Expense Tracker",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 60, color: Colors.white, letterSpacing: 2))
          ],
        ),
      ),
    );
  }
}
