import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealdetailPage extends StatelessWidget {
  static const mealDetailPage = '/meal-DetailPage';

  final Function favoriteM;
  final Function isFavorite;

  MealdetailPage(this.isFavorite,this.favoriteM);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final mdetails = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildcontainerList(BuildContext context, child) {
      return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          height: 170,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: child);
    }

    return Scaffold(
      appBar: AppBar(title: Text(mdetails.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(mdetails.imageUrl, fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            buildcontainerList(
              context,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      color: Colors.limeAccent,
                      margin: EdgeInsets.all(5),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(mdetails.ingredients[index])));
                },
                itemCount: mdetails.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            buildcontainerList(
              context,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.brown,
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(mdetails.steps[index]),
                      ),
                      Divider()
                    ],
                  );
                },
                itemCount: mdetails.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
           isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: ()=>favoriteM(mealId),
      ),
    );
  }
}
