import 'package:flutter/material.dart';
import 'package:my_app/runner/runner_game.dart';
import 'package:flame/game.dart';


class RunnerGamePage extends StatefulWidget {
  const RunnerGamePage({Key? key}) : super(key: key);

  @override
  RunnerGameState createState() => RunnerGameState();
}

class RunnerGameState extends State<RunnerGamePage> {
  RunnerGame game = RunnerGame();

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
