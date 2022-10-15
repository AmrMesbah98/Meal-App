import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_Item.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen({Key key}) : super(key: key);

  static const routeName = 'category_meal';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayMeal;
  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryID = routeArg['id'];
    categoryTitle = routeArg['title'];

    displayMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    super.didChangeDependencies();
  }

  void removemeal(String mealID) {
  
      displayMeal.removeWhere((meal) => meal.id == mealID);
 
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeal[index].id,
            title: displayMeal[index].title,
            imageurl: displayMeal[index].imageUrl,
            duration: displayMeal[index].duration,
            complexity: displayMeal[index].complexity,
            affordability: displayMeal[index].affordability,
          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
