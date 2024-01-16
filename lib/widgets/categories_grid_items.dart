import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';

class CategoriesGridItems extends StatelessWidget {
  const CategoriesGridItems(
      {super.key, required this.category, required this.onSelectedCategory});
  final Category category;
  final void Function() onSelectedCategory;
  @override
  Widget build(context) {
    return InkWell(
      onTap: onSelectedCategory,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(.55),
            category.color.withOpacity(.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
    );
  }
}
