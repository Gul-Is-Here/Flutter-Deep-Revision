import 'package:flutter/material.dart';

class MealItemTraits extends StatelessWidget {
  const MealItemTraits({super.key, required this.icon, required this.duration});
  final IconData icon;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 12,
        ),
        Text(
          duration,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
