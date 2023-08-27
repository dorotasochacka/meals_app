import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/filter_switch.dart';
import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _lactoseFreeFilterSet = false;
  var _glutenFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final currentFilters = ref.read(filtersProvider);
    _lactoseFreeFilterSet = currentFilters[Filter.glutenFree]!;
    _glutenFreeFilterSet = currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = currentFilters[Filter.vegetarian]!;
    _veganFilterSet = currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pop();
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (ctx) {
      //         return const TabsScreen();
      //       }),
      //     );
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });

          //Navigator.of(context).pop();

          return true;
        },
        child: Column(
          children: [
            FilterSwitch(
              title: 'Gluten-free',
              value: _glutenFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _glutenFreeFilterSet = newValue;
                });
              },
            ),
            FilterSwitch(
              title: 'Lactose-free',
              value: _lactoseFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _lactoseFreeFilterSet = newValue;
                });
              },
            ),
            FilterSwitch(
              title: 'Vegetarian',
              value: _vegetarianFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _vegetarianFilterSet = newValue;
                });
              },
            ),
            FilterSwitch(
              title: 'Vegan',
              value: _veganFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _veganFilterSet = newValue;
                });
              },
            ),
          ],
        ),
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
