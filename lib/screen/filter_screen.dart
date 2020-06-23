import 'package:flutter/material.dart';

import '../Widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const filter = '/filter';
  final Function _filter;
  final Map<String, bool> filtersave;
  FilterScreen(this.filtersave, this._filter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenfree = false;
  var lactosefree = false;
  var vegetarian = false;
  var vegan = false;

  Widget switchBuilder(String title, String subTitle, var item, var newValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: item,
        onChanged: newValue);
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      glutenfree = widget.filtersave['glutenfree'];
      lactosefree = widget.filtersave['lactosefree'];
      vegetarian = widget.filtersave['vegetarian'];
      vegan = widget.filtersave['vegan'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filter"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final filterstream = {
                  'glutenfree': glutenfree,
                  'lactosefree': lactosefree,
                  'vegetarian': vegetarian,
                  'vegan': vegan
                };
                widget._filter(filterstream);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust meal Selection",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                switchBuilder(
                    "Gluten-free", "Only include gluten-free meals", glutenfree,
                    (newValue) {
                  setState(() {
                    glutenfree = newValue;
                  });
                }),
                switchBuilder("Lactose-free", "Only include lactose-free meals",
                    lactosefree, (newValue) {
                  setState(() {
                    lactosefree = newValue;
                  });
                }),
                switchBuilder(
                    "Vegetarian", "Only include vegetarian meals", vegetarian,
                    (newValue) {
                  setState(() {
                    vegetarian = newValue;
                  });
                }),
                switchBuilder("Vegan", "Only include vegan meals", vegan,
                    (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
