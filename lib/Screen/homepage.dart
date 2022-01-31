import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../reusablecard.dart';
import '../unogame.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white30,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UnoGame()));
              },
              child: const ReusableCard(
                color: Colors.blue,
                image: 'images/unopic.jpg',
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    color: Colors.yellow,
                    image: 'images/XandO.png',
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Colors.purple,
                    image: 'images/XandO.png',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    color: Colors.pink,
                    image: 'images/plusicone.png',
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Colors.deepOrange,
                    image: 'images/unopic.jpg',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(
                        800,
                        (200 * 0.625)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 1,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.black,
                      child: const Icon(
                        Icons.videogame_asset_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.update),
                        ),
                        Container(
                          width: 30,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.supervisor_account_sharp),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.account_circle_outlined),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
