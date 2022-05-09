import 'package:flutter/material.dart';
import 'package:gamebe/games/chess_game.dart';
import 'package:gamebe/games/uno.dart';
import 'package:gamebe/unogame.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                backgroundColor: Colors.blue,
                flexibleSpace: Stack(
                  children: [
                    Positioned.fill(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UnoGame()),
                          );
                        },
                        child: Image.asset(
                          'images/unopic.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (context, index) {
              //       return Container(
              //         height: 50,
              //         alignment: Alignment.center,
              //         color: Colors.green[100 * (index % 9)],
              //       );
              //     },
              //     childCount: 20,
              //   ),
              // ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChessGame()),
                        );
                      },
                      child: AbsorbPointer(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/chess4.jpg')),
                          ),
                          margin: const EdgeInsets.all(1),
                          height: 50,
                          alignment: Alignment.center,
                        ),
                      ),
                    );
                  },
                  childCount: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
