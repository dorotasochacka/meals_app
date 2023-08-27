import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.9),
                    Theme.of(context).primaryColor.withOpacity(0.3)
                  ]),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              //color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  //color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
              //color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  //color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
// import 'package:google_fonts/google_fonts.dart';

// import '../screens/filters_screen.dart';

// class MainDrawer extends StatelessWidget {
//   const MainDrawer({super.key});

//   Widget _buildDrawerItem(
//       Icon icon, String title, String routeName, BuildContext context) {
//     return ListTile(
//       leading: icon,
//       title: Text(
//         title,
//         style: GoogleFonts.robotoCondensed(
//           fontSize: 18,
//         ),
//       ),
//       onTap: () => Navigator.of(context).pushReplacementNamed(routeName),
//       splashColor: Theme.of(context).primaryColor,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: Theme.of(context).secondaryHeaderColor,
//       child: Column(children: [
//         Container(
//           height: 120,
//           width: double.infinity,
//           padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
//           alignment: Alignment.centerLeft,
//           color: Theme.of(context).primaryColorLight,
//           child: ListTile(
//             leading: const Icon(Icons.fastfood_rounded, size: 60),
//             title: FittedBox(
//               child: Text(
//                 'Cooking up!',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 32,
//                     fontFamily: 'RobotoCondensed',
//                     color: Theme.of(context).primaryColorDark),
//               ),
//             ),
//           ),
//         ),
//         _buildDrawerItem(
//           const Icon(Icons.restaurant),
//           'Meals',
//           '/',
//           context,
//         ),
//         _buildDrawerItem(
//           const Icon(Icons.settings),
//           'Filters',
//           FiltersScreen.routeName,
//           context,
//         ),
//         _buildDrawerItem(
//           const Icon(Icons.face),
//           'Account',
//           '/',
//           context,
//         ),
//         _buildDrawerItem(
//           const Icon(Icons.hail),
//           'Log out',
//           '/',
//           context,
//         ),
//       ]),
//     );
//   }
// }
