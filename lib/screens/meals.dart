import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import '../model/meal.dart';
import '../widgets/meal_items.dart';

// ignore: must_be_immutable
class MealsScreen extends StatelessWidget {
  MealsScreen(
      {super.key,
      this.title,
      required this.meal,
      required this.toggledFavourite});
  final String? title;
  final List<Meal> meal;
  void Function(Meal meal) toggledFavourite;
  void onSelectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MealDetailScreen(
        meal: meal,
        isFavouriteToggleMeal: toggledFavourite,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center();
    if (meal.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                textAlign: TextAlign.center,
                'Oh ... There is no meal in this Category try different one',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Please try another category',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer),
              ),
            ),
          ],
        ),
      );
    }
    if (meal.isNotEmpty) {
      content = Center(
          child: ListView.builder(
              itemExtent: MediaQuery.of(context).size.height * .24,
              itemCount: meal.length,
              itemBuilder: (context, index) => MealItems(
                    meal: meal[index],
                    onSelectedMeal: onSelectedMeal,
                  )));
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(child: content),
    );
  }
}
