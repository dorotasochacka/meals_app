import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';
import '../widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  String get complexityText {
    return describeEnum(meal.complexity)[0].toUpperCase() +
        describeEnum(meal.complexity).substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        describeEnum(meal.affordability).substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Stack(children: <Widget>[
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 260,
              width: double.infinity,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              color: Colors.black54,
              child: Column(children: [
                Text(
                  meal.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MealItemTrait(
                        icon: Icons.schedule, label: '${meal.duration} min'),
                    const SizedBox(
                      width: 12,
                    ),
                    MealItemTrait(
                      icon: Icons.leaderboard,
                      label: complexityText,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    MealItemTrait(
                      icon: Icons.monetization_on_outlined,
                      label: affordabilityText,
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
