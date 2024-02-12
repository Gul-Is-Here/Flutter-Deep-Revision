// import 'package:flutter/material.dart';

// enum Filter { glutenFree, lactoseFree, vegetarian, vegan, glutenFre }

// class FilterScreen extends StatefulWidget {
//   const FilterScreen({super.key});

//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   bool glutenFreeFilterSet = false;
//   bool lactoseFreeFilterSet = false;
//   bool vegetarinaFilterSet = false;
//   bool veganFilterSet = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Filter"),
//       ),
//       body: PopScope(
//         canPop: false,
//         onPopInvoked: (bool didPop) {
//           if (didPop) return;
//           Navigator.of(context).pop({
//             Filter.glutenFree: glutenFreeFilterSet,
//             Filter.lactoseFree: lactoseFreeFilterSet,
//             Filter.vegetarian: vegetarinaFilterSet,
//             Filter.vegan: veganFilterSet,
//           });
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: glutenFreeFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   glutenFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Gluten-Free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: const Text('Only include Gluten-Free Meal'),
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
//             ),
//             SwitchListTile(
//               value: lactoseFreeFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   lactoseFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Lactose-Free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: const Text('Only include Lactose-Free Meal'),
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
//             ),
//             SwitchListTile(
//               value: vegetarinaFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   vegetarinaFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegetarine',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: const Text('Only include Vegetarine Meal'),
//               contentPadding://                   const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
//             ),
//             SwitchListTile(
//               value: veganFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   veganFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegan',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: const Text('Only include Vegan Meal'),
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
