import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  // @override
  // void initState() {
  //   final routeArgs =
  //       ModalRoute.of(context)?.settings.arguments as Map<String, String>;
  //   categoryTitle = routeArgs['title']!;
  //   final categoryId = routeArgs['id'];
  //   displayedMeals = DUMMY_MEALS.where((item) {
  //     return item.categories.contains(categoryId);
  //   }).toList();
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    // for me it wasn't needed
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((item) {
        return item.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? ""),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = displayedMeals[index];
          return MealItem(
            id: item.id,
            title: item.title,
            imageUrl: item.imageUrl,
            duration: item.duration,
            complexity: item.complexity,
            affordability: item.affordability,
            // removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
