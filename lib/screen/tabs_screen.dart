import 'package:flutter/material.dart';

import './category_screen.dart';
import './favorite_screen.dart';
import '../Widget/main_drawer.dart';
import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritel;

  TabsScreen(this.favoritel);

  State<StatefulWidget> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> pages;
  @override
  void initState() {
    pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': MyFavoriteScreen(widget.favoritel), 'title': 'MyFavorite'}
    ];
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _selected(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[selectedIndex]['title'],
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      drawer: MainDrawer(),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.orange,
          currentIndex: selectedIndex,
          onTap: _selected,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categories"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("MyFavorite"))
          ]),
    );
  }
}
