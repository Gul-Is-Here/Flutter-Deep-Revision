import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_items_traits.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItems extends StatelessWidget {
  MealItems({super.key, required this.meal, required this.onSelectedMeal});
  final Meal meal;
  void Function(BuildContext context, Meal meal) onSelectedMeal;
  String get complexityText {
    return meal.complexity.name[0].toString().toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordbilityText {
    return meal.affordability.name[0].toString().toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        margin: const EdgeInsets.all(8),
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            onSelectedMeal(context, meal);
          },
          child: Stack(
            children: [
              FadeInImage(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl)),
              Positioned(
                  top: MediaQuery.of(context).size.height * .12,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTraits(
                                icon: Icons.timelapse,
                                duration: '${meal.duration} min'),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemTraits(
                                icon: Icons.work, duration: complexityText),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemTraits(
                                icon: Icons.money_sharp,
                                duration: affordbilityText)
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
