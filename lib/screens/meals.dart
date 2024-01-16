import 'package:flutter/material.dart';

import '../model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meal});
  final String title;
  final List<Meal> meal;
  @override
  Widget build(BuildContext context) {
    Widget content = Center();
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
            itemCount: meal.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(meal[index].imageUrl),
                  Text(
                    meal[index].title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    meal[index].ingredients[index],
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              );
            }),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: content),
    );
  }
}
