
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'package:flame/text.dart';
import 'package:flame/palette.dart';
import 'dart:math';

import 'components/world.dart';
import 'components/backbtn.dart';
import 'components/tile.dart';

enum GameStatus {
  running,
  paused,
  over,
  exited
}

class MineGame extends FlameGame with HasTappables {
  final World _world = World();
  Random random = Random();
  GameStatus gameStatus = GameStatus.running;
  BackBtn backBtn = BackBtn();
  List<Tile> tiles = [];

  @override
  Future<void> onLoad() async {
    gameStatus = GameStatus.running;
    await add(_world);

    // add game tiles
    double sizeRef = size.x / 10;
    if (size.x > size.y)
        sizeRef = size.y / 10;
    for (var i = 0; i < 8; i++) {
        for (var j = 0; j < 8; j++) {
            Tile newTile = Tile();
            newTile.size = Vector2.all(sizeRef);
            newTile.position = Vector2(sizeRef * (1 + (i)), sizeRef * (1 + (j)));
            add(newTile);
            tiles.add(newTile);
        }
    }
    // add bomb
    var bombCount = 0;
    while (bombCount < 10) {
        var next_bomb = random.nextInt(64);
        if (!tiles[next_bomb].isBomb) {
            tiles[next_bomb].isBomb = true;
            bombCount++;
        }
    }
  }

  @override
  void update(double delta) {
    super.update(delta);

    if (backBtn.clicked && gameStatus != GameStatus.exited) {
      _goBack();
    }

    if (gameStatus == GameStatus.running) {

    }
  }

  void _goBack() {
    if (buildContext != null) {
      Navigator.pop(buildContext!);
      gameStatus = GameStatus.exited;
    }
  }

}
