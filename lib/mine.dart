import 'package:flutter/material.dart';
import 'package:my_app/mine/mine_game.dart';
import 'package:flame/game.dart';


class MineGamePage extends StatefulWidget {
  const MineGamePage({Key? key}) : super(key: key);

  @override
  MineGameState createState() => MineGameState();
}

class MineGameState extends State<MineGamePage> {
  MineGame game = MineGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Stack(
        children: [
          GameWidget(
              game: game,
            ),
          ],
        ),
      );
  }
}
