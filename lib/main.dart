import 'package:flutter/material.dart';

import './screen/categorymeal_screen.dart';
import './screen/mealdetail_screen.dart';
import './screen/tabs_screen.dart';
import './screen/favorite_screen.dart';
import './screen/filter_screen.dart';
import './dummy_data.dart';
import './model/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> meals = DUMMY_MEALS;
  List<Meal> favorite = [];

  Map<String, bool> filter = {
    'glutenfree': false,
    'lactosefree': false,
    'vegetarian': false,
    'vegan': false
  };

  void filterFunction(Map<String, bool> filterdata) {
    setState(() {
      filter = filterdata;

      meals = DUMMY_MEALS.where((meal) {
        if (filter['glutenfree'] && !meal.isGlutenFree) {
          return false;
        }

        if (filter['lactosefree'] && !meal.isLactoseFree) {
          return false;
        }

        if (filter['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        if (filter['vegan'] && !meal.isVegan) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void favoriteM(String id) {
    var fmeal = favorite.indexWhere((meal) => meal.id == id);
    if (fmeal >= 0) {
      setState(() {
        favorite.removeAt(fmeal);
      });
    } else {
      setState(() {
        favorite.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == id),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return favorite.any((meal) => meal.id == id);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsScreen(favorite),
      title: "Kitchen App",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.indigoAccent,
        textTheme: TextTheme(
            headline6:
                TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold),
            headline5:
                TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.bold)),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        CategoryMeal.mealRoute: (context) => CategoryMeal(meals),
        MealdetailPage.mealDetailPage: (context) => MealdetailPage(_isMealFavorite,favoriteM),
        MyFavoriteScreen.myFavorite: (context) => MyFavoriteScreen(favorite),
        FilterScreen.filter: (context) => FilterScreen(filter, filterFunction)
      },
    );
  }
}
