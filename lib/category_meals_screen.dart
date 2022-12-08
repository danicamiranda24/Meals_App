import 'package:Meals_app/models/meals.dart';
import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String _categoryId;
  // final String _categoryTitle;

  // CategoryMealsScreen(this._categoryId, this._categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final _categoryId = routeArgs['id'];
    final _categoryTitle = routeArgs['title'];
    final _categorymeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(_categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: ((ctx, index) {
          return Text(_categorymeals[index].title);
        }),
        itemCount: _categorymeals.length,
      ),
    );
  }
}
