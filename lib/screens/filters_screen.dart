import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/filter_switch.dart';
import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  // void initState() {
  //   super.initState();
  //   final currentFilters = ref.read(filtersProvider);
  //   _lactoseFreeFilterSet = currentFilters[Filter.glutenFree]!;
  //   _glutenFreeFilterSet = currentFilters[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = currentFilters[Filter.vegetarian]!;
  //   _veganFilterSet = currentFilters[Filter.vegan]!;
  // }

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
// import '../widgets/main_drawer.dart';
// import '../widgets/build_switch_list_tile.dart';

// class FiltersScreen extends StatelessWidget {
//   static const routeName = '/filters';
//   const FiltersScreen({super.key});

//   final _isGlutenFree = false;
//   final _isLactoseFree = false;
//   final _isVegan = false;
//   final _isVegetarian = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Filters'),
//       ),
//       drawer: const MainDrawer(),
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(30),
//             child: Text(
//               'Your filters',
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(10),
//             height: 500,
//             child: ListView(
//               children: [
//                 BuildSwitchListTile(
//                   'gluten-free',
//                   'only gluten-free meals',
//                   _isGlutenFree,
//                 ),
//                 BuildSwitchListTile(
//                   'lactose-free',
//                   'only lactose-free meals',
//                   _isLactoseFree,
//                 ),
//                 BuildSwitchListTile(
//                   'vegan',
//                   'only vegan meals',
//                   _isVegan,
//                 ),
//                 BuildSwitchListTile(
//                   'vegetarian',
//                   'only vegetarian meals',
//                   _isVegetarian,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
