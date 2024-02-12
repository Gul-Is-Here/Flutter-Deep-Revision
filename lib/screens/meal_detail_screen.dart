import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.meal, required this.isFavouriteToggleMeal});
  final Meal meal;
  final void Function(Meal meal) isFavouriteToggleMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                isFavouriteToggleMeal(meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              meal.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Ingredients',
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // ignore: unused_local_variable
            for (final ingred in meal.ingredients)
              Text(ingred,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // ignore: unused_local_variable
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text(step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
              )
          ],
        ),
      ),
    );
  }
}
