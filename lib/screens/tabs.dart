import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> isFavourite = [];
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

  void onSelectedScreen(String identifer) {
    if (identifer == 'filter') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const FilterScreen();
      }));
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      toggledFavourite: isFavouriteToggled,
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
