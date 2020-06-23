import 'package:flutter/material.dart';

import '../Widget/mealitem.dart';
import '../model/meal.dart';

class MyFavoriteScreen extends StatelessWidget {
  static const myFavorite = "/myfavorite";

  final List<Meal> favoritel;

  MyFavoriteScreen(this.favoritel);
  @override
  Widget build(BuildContext context) {
    if (favoritel.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return Scaffold(
          body: ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                    id: favoritel[index].id,
                    title: favoritel[index].title,
                    imageUrl: favoritel[index].imageUrl,
                    duration: favoritel[index].duration,
                    complexity: favoritel[index].complexity,
                    affordability: favoritel[index].affordability);
              },
              itemCount: favoritel.length));
    }
  }
}
