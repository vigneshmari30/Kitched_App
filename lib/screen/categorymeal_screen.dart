import 'package:flutter/material.dart';

import '../widget/mealitem.dart';
import '../model/meal.dart';

class CategoryMeal extends StatefulWidget {
  static const mealRoute = '/category-meal';
  List<Meal> mealStream;
  CategoryMeal(this.mealStream);
  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  List<Meal> displayedmeals;
  String cTitle;
  var _loadedInitData = false;
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      cTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedmeals = widget.mealStream.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedmeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(cTitle),
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: displayedmeals[index].id,
                title: displayedmeals[index].title,
                imageUrl: displayedmeals[index].imageUrl,
                duration: displayedmeals[index].duration,
                complexity: displayedmeals[index].complexity,
                affordability: displayedmeals[index].affordability,
              );
            },
            itemCount: displayedmeals.length));
  }
}
