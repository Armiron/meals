import 'package:flutter/material.dart';
import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // accentColor: Colors.redAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      // home: CategoriesScreen(
      //   key: UniqueKey(),
      // ),
      home: TabsScreen(
        key: UniqueKey(),
      ),
      routes: {
        // '/': () => is home
        // '/': (context) => TabsScreen(),
        // '/category-meals': (context) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name) {
        // dynamic routes etc
        // }
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(key: UniqueKey()),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(key: UniqueKey()),
        );
      },
    );
  }
}
