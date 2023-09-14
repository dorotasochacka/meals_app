import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/meal.dart';
import '../providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                  wasAdded
                      ? 'Meal added as a favorite!'
                      : 'Meal is no longer a favorite!',
                  style: const TextStyle(fontSize: 16),
                )),
              );
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).secondaryHeaderColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(
                        meal.steps[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  },
                  itemCount: meal.steps.length,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // for (final step in meal.steps)
              //   ListTile(
              //     leading: CircleAvatar(child: Text('s')),
              //     title: Text(
              //       step,
              //       style: Theme.of(context).textTheme.bodyMedium,
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
