import 'package:flutter/material.dart';

import './meals_screen.dart';
import '../widgets/category_grid_item.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../data.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    var categoryMeals = widget.availableMeals
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
    return AnimatedBuilder(
      animation: _animationController,
      child: Container(
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
                onSelectCategory: () => _selectCategory(context, category),
              ),
          ],
        ),
      ),
      builder: (context, child) => SlideTransition(
          position: Tween(
            begin: const Offset(1, 1),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOutQuint)),
          child: child),
    );
  }
}
