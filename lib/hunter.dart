import 'package:flutter/material.dart';
import 'package:my_app/hunter/hunter_game.dart';
import 'package:flame/game.dart';


class HunterGamePage extends StatefulWidget {
  const HunterGamePage({Key? key}) : super(key: key);

  @override
  HunterGameState createState() => HunterGameState();
}

class HunterGameState extends State<HunterGamePage> {
  HunterGame game = HunterGame();

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
