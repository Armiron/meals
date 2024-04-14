import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen(this.favoriteMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late Timer _timer;

  final int _interval = 1000;

  void _updateScreen() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: _interval), (Timer timer) {
      _updateScreen();
    });
  }

  @override
  void dispose() {
    // Dispose the timer when the widget is disposed to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  Future<void> _refreshFavorites() async {
    await Future.delayed(Duration(milliseconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return RefreshIndicator(
        onRefresh: _refreshFavorites,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final item = widget.favoriteMeals[index];
            return MealItem(
              id: item.id,
              title: item.title,
              imageUrl: item.imageUrl,
              duration: item.duration,
              complexity: item.complexity,
              affordability: item.affordability,
            );
          },
          itemCount: widget.favoriteMeals.length,
        ),
      );
    }
  }
}
