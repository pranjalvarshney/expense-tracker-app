import 'package:flutter/material.dart';
import 'package:quiz_app/screens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: true,
      theme: ThemeData(accentColor: Colors.amber, primaryColor: Colors.amber),
    );
  }
}
