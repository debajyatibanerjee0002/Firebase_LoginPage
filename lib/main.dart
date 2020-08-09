import 'package:firebase_flutter/homepage.dart';
import 'package:firebase_flutter/loginpage.dart';
import 'package:firebase_flutter/signuppage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInPage(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => MyApp(),
        '/signup': (BuildContext context) => SignUpPage(),
        '/home': (BuildContext context) => HomePage()
      },
    );
  }
}
