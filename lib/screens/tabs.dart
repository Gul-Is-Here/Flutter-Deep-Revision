import 'package:flutter/material.dart';
import 'package:meals_app/model/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/categories.dart';
// import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> isFavourite = [];
  Map<Filter, bool> selectedFilter = kInitialFilter;
  int selectedPageIndex = 0;
  String activeTitlePage = 'Categories';
  void selectedPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }

  void isFavouriteToggled(Meal meal) {
    final isExisted = isFavourite.contains(meal);
    if (isExisted) {
      setState(() {
        isFavourite.remove(meal);
        _showInfoMessage('Meal is no Longer Favourite');
      });
    } else {
      setState(() {
        isFavourite.add(meal);
        _showInfoMessage('Meal Marked as Favourite');
      });
    }
  }

  void onSelectedScreen(String identifer) async {
    Navigator.of(context).pop();
    if (identifer == 'filter') {
      final result = await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (context) {
        return const FilterScreen();
      }));
      setState(() {
        selectedFilter = result ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (selectedFilter[Filter.glutenFree]! as bool && !meal.isGlutenFree) {
        return false;
      }

      if (selectedFilter[Filter.lactoseFree]! as bool && !meal.isLactoseFree) {
        return false;
      }

      if (selectedFilter[Filter.vegetarian]! as bool && !meal.isVegetarian) {
        return false;
      }

      if (selectedFilter[Filter.vegan]! as bool && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activeScreen = CategoriesScreen(
      onToggleFavorite: isFavouriteToggled,
      availableMeals: availableMeals,
    );

    if (selectedPageIndex == 1) {
      activeScreen =
          MealsScreen(toggledFavourite: isFavouriteToggled, meal: isFavourite);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitlePage),
      ),
      drawer: MainDrawer(
        onSelectedScreen: onSelectedScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPageIndex,
          onTap: selectedPage,
          items: const [
            BottomNavigationBarItem(
                label: 'Categories',
                icon: Icon(
                  Icons.set_meal,
                )),
            BottomNavigationBarItem(
                label: 'Favourite',
                icon: Icon(
                  Icons.favorite,
                ))
          ]),
    );
  }
}
