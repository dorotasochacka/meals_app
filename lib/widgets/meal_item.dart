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
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 260,
            width: double.infinity,
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







// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:meals_app/screens/meal_detail_screen.dart';
// import '../models/meal.dart';

// class MealItem extends StatelessWidget {
//   final String? id;
//   final String? title;
//   final String? imageUrl;
//   final int? duration;
//   final Complexity? complexity;
//   final Affordability? affordability;
//   final Function? removeItem;

//   const MealItem({
//     super.key,
//     required this.id,
//     required this.title,
//     required this.imageUrl,
//     required this.duration,
//     required this.complexity,
//     required this.affordability,
//     required this.removeItem,
//   });

//   // String get complexityText {
//   //   if (complexity == Complexity.simple) {
//   //     return 'Simple';
//   //   } else if (complexity == Complexity.challenging) {
//   //     return 'Challenging';
//   //   } else {
//   //     return 'Hard';
//   //   }
//   //} to jest nieuzywane, za to ze jest uzyte: describeEnum(complexity!)

//   String? get affordabilityText {
//     switch (affordability) {
//       case Affordability.affordable:
//         return 'affordable';

//       case Affordability.pricey:
//         return 'pricey';

//       case Affordability.luxurious:
//         return 'luxurious';

//       default:
//         return 'Unknown';
//     }
//   }

//   void selectMeal(BuildContext ctx) {
//     Navigator.of(ctx)
//         .pushNamed(
//       MealDetailScreen.routeName,
//       arguments: id,
//     )
//         .then((result) {
//       if (result != null) {
//         removeItem!(result);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => selectMeal(context),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 4,
//         margin: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                   ),
//                   child: Image.network(
//                     imageUrl!,
//                     height: 250,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   right: 10,
//                   bottom: 20,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         color: Colors.black54,
//                         borderRadius: BorderRadius.all(Radius.circular(5))),
//                     alignment: Alignment.bottomCenter,
//                     width: 300,
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                     child: Text(
//                       title!,
//                       style: const TextStyle(fontSize: 25, color: Colors.white),
//                       //textAlign: TextAlign.center,
//                       softWrap: true,
//                       overflow: TextOverflow.fade,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(
//                     children: [
//                       const Icon(Icons.schedule),
//                       const SizedBox(width: 3),
//                       Text(
//                         '$duration min',
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.work_outline),
//                       const SizedBox(width: 3),
//                       Text(describeEnum(complexity!)),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.monetization_on_outlined),
//                       const SizedBox(width: 3),
//                       Text(affordabilityText!),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
