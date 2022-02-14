import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class ChessGame extends StatefulWidget {
  static const String id = 'chess_game';
  const ChessGame({Key? key}) : super(key: key);

  @override
  _ChessGameState createState() => _ChessGameState();
}

class _ChessGameState extends State<ChessGame> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess '),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: ChessBoard(
                controller: controller,
                boardColor: BoardColor.darkBrown,
                boardOrientation: PlayerColor.white,
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Chess>(
              valueListenable: controller,
              builder: (context, game, _) {
                return Text(
                  controller.getSan().fold(
                        '',
                        (previousValue, element) =>
                            previousValue + '\n' + (element ?? ''),
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
