import 'package:flutter/material.dart';
import 'unogame.dart';

// class ReusableCard extends StatelessWidget {
//   ReusableCard({Key? key, required this.color}) : super(key: key);
//   Color color;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: Ink.image(
//         image: const AssetImage('images/unopic.jpg'),
//         child: InkWell(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const UnoGame()));
//           },
//         ),
//       ),
//     );
//   }
// }
class ReusableCard extends StatelessWidget {
  const ReusableCard({Key? key, required this.color, required this.image})
      : super(key: key);

  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          ),
          color: color,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
