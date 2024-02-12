import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFreeFilterSet = false;
  bool lactoseFreeFilterSet = false;
  bool vegetarinaFilterSet = false;
  bool veganFilterSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply Filter"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                glutenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: const Text('Only include Gluten-Free Meal'),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
          ),
          SwitchListTile(
            value: glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                glutenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: const Text('Only include Gluten-Free Meal'),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
          ),
          SwitchListTile(
            value: glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                glutenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: const Text('Only include Gluten-Free Meal'),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          SwitchListTile(
            value: glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                glutenFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: const Text('Only include Gluten-Free Meal'),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          )
        ],
      ),
    );
  }
}
