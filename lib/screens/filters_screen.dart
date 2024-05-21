import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/widgets/filter_switch.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          FilterSwitch(
            title: 'Gluten-free',
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, newValue);
            },
          ),
          FilterSwitch(
            title: 'Lactose-free',
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, newValue);
            },
          ),
          FilterSwitch(
            title: 'Vegetarian',
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, newValue);
            },
          ),
          FilterSwitch(
            title: 'Vegan',
            value: activeFilters[Filter.vegan]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, newValue);
            },
          ),
        ],
      ),
    );
  }
}
