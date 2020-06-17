import 'package:flutter/material.dart';

import './screen/category_screen.dart';
import './screen/categorymeal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryScreen(),
      title: "Kitchen App",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.indigoAccent,
        textTheme: TextTheme(
          headline6:
              TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold),
              headline5: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.bold)
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {CategoryMeal.mealRoute: (ctx) => CategoryMeal()},
    );
  }
}
