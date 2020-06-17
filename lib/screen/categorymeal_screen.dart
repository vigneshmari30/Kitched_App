import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoryMeal extends StatelessWidget {
  static const mealRoute = '/category-meal';

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    var meals = DUMMY_MEALS.where((data) {
      return data.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return Text(meals[index].title);
            },
            itemCount: meals.length));
  }
}
