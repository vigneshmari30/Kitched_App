import 'package:flutter/material.dart';

import './category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryScreen(),
      title: "Kitchen App",
      theme: ThemeData(
        primarySwatch: Colors.lime,
        accentColor: Colors.limeAccent,
        textTheme: TextTheme(headline6: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold))
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
