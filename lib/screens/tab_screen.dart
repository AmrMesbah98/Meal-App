import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/widgets/drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMael;
  TabScreen(this.favouriteMael);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> Page;

  @override
  void initState() {
    Page = [
      {
        'page': const CategoriesScreen(),
        'title': 'categories',
      },
      {
        'page': FavouriteScreen(widget.favouriteMael),
        'title': 'Favourite',
      },
    ];
    super.initState();
  }

  int selectIndexPage = 0;

  void selectpage(int value) {
    setState(() {
      selectIndexPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Page[selectIndexPage]['title']),
      ),
      body: Page[selectIndexPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectIndexPage,
        onTap: selectpage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
