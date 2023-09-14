import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  final IconData icon;
  final String label;

  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 17,
        ),
        const SizedBox(width: 3),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';

// import '../data.dart';
// import '../widgets/ingredients_section.dart';
// import '../widgets/steps_section.dart';

// class MealItemTrait extends StatelessWidget {
//   static const routeName = '/meal-detail';

//   const MealItemTrait({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final mealId = ModalRoute.of(context)!.settings.arguments as String;
//     final selectedMeal = mealsList.firstWhere(
//       (meal) => meal.id == mealId,
//     );
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(selectedMeal.title!tgftftf),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Theme.of(context).secondaryHeaderColor,
//           margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: Image.network(
//                   selectedMeal.imageUrl!,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                 child: Text(
//                   selectedMeal.title!,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headlineMedium!
//                       .copyWith(color: Colors.black.withOpacity(0.7)),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               IngredientsSection(
//                   selectedMeal.ingredients!,
//                   selectedMeal.duration,
//                   selectedMeal.complexity,
//                   selectedMeal.affordability),
//               const SizedBox(
//                 height: 20,
//               ),
//               StepsSection(selectedMeal.steps!),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         onPressed: () {
//           Navigator.of(context).pop(mealId);
//         },
//         child: const Icon(
//           Icons.delete,
//         ),
//       ),
//     );
//   }
// }
