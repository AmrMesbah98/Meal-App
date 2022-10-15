import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_meal_screen.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tab_screen.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void toggelfavourite(String mealID) {
    final existing = favouriteMeal.indexWhere((meal) => meal.id == mealID);

    if (existing >= 0) {
      setState(() {
        favouriteMeal.removeAt(existing);
      });
    } else {
      return favouriteMeal
          .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
    }
  }

  bool ismealFavourite(String id) {
    return favouriteMeal.any((meal) => meal.id == id);
  }

  List<Meal> favouriteMeal = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              titleMedium: const TextStyle(
                fontSize: 25,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //home: const MyApp(),
      //home: const CategoriesScreen(),
      routes: {
        '/': (context) => TabScreen(favouriteMeal),
        CategoryMealScreen.routeName: (context) => const CategoryMealScreen(),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(toggelfavourite,ismealFavourite),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: const CategoriesScreen(),
    );
  }
}
