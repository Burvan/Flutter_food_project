import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class DetailedDishScreen extends StatelessWidget {
  final Dish dish;

  const DetailedDishScreen({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(dish.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: SelectedDishImage(imagePath: dish.imagePath),
                ),
                const SizedBox(height: 25),
                Text(
                  dish.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  dish.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Ingredients',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: dish.ingredients?.map((ingredient) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: themeData.primaryColor,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                ingredient,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      }).toList() ??
                      [],
                ),
                const SizedBox(height: 25),
                Text(
                  'Cost: ${dish.cost} BYN',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class DetailedDishScreen extends StatelessWidget {
//   final Dish dish;
//
//   const DetailedDishScreen({
//     Key? key,
//     required this.dish,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(dish.name),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Center(
//                   child: Hero(
//                     tag: 'dishImage-${dish.id}',
//                     child: SelectedDishImage(imagePath: dish.imagePath),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   dish.name,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Text(
//                   dish.description,
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 const Text(
//                   'Ingredients',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22,
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Column(
//                   children: dish.ingredients?.map((ingredient) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.circle,
//                             size: 10,
//                             color: Colors.green,
//                           ),
//                           const SizedBox(width: 5),
//                           Text(
//                             ingredient,
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList() ?? [],
//        ),
//                 const SizedBox(height: 25),
//                 Text(
//                   'Cost: ${dish.cost} BYN',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
