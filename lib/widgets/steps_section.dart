// import 'package:flutter/material.dart';

// class StepsSection extends StatelessWidget {
//   final List steps;
//   const StepsSection(this.steps, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'Steps',
//           style: Theme.of(context).textTheme.headlineSmall,
//         ),
//         Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             decoration: BoxDecoration(
//                 color: Colors.white54,
//                 border: Border.all(
//                   color: Theme.of(context).primaryColor,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(8)),
//             height: 300,
//             child: ListView.builder(
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Theme.of(context).primaryColor,
//                         foregroundColor: Colors.white,
//                         child: Text(
//                           '${index + 1}.',
//                         ),
//                       ),
//                       title: Text(
//                         steps[index],
//                       ),
//                     ),
//                     const Divider(
//                       height: 5,
//                       thickness: 1,
//                     ),
//                   ],
//                 );
//               },
//               itemCount: steps.length,
//             )),
//       ],
//     );
//   }
// }
