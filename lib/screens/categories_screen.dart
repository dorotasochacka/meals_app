import 'package:flutter/material.dart';

import './meals_screen.dart';
import '../widgets/category_grid_item.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../data.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;

  const CategoriesScreen({super.key, required this.availableMeals});

  _selectCategory(BuildContext context, Category category) {
    var categoryMeals = availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MealsScreen(
          title: category.title,
          meals: categoryMeals,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        children: <Widget>[
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () => _selectCategory(context, category)),
          // ...categoriesList
          //     .map((category) => CategoryGridItem(
          //           category: category,
          //         ))
          //     .toList(),
        ],
      ),
    );
  }
}
