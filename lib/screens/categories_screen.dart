import 'package:flutter/material.dart';
import 'package:meals_app/model/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/categories_grid_items.dart';

import '../model/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            MealsScreen(title: category.title, meal: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Categories'),
      ),
      body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              // mainAxisExtent: 250,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (var category in availableCategories)
              CategoriesGridItems(
                  category: category,
                  onSelectedCategory: () {
                    _selectedCategory(context, category);
                  })
          ]),
    );
  }
}
