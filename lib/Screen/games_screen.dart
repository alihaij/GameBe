import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      child: Image.asset(
                        'images/unopic.jpg',
                        fit: BoxFit.cover,
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
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(1),
                        height: 50,
                        alignment: Alignment.center,
                        color: Colors.deepPurple[100 * (index % 9)],
                      ),
                    );
                  },
                  childCount: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
