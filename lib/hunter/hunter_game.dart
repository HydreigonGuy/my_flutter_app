
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'package:flame/text.dart';
import 'package:flame/palette.dart';
import 'dart:math';

import 'components/world.dart';
import 'components/bomb.dart';
import 'components/backbtn.dart';

enum GameStatus {
  running,
  paused,
  over,
  exited
}

class HunterGame extends FlameGame with HasCollisionDetection, HasTappables {
  final World _world = World();
  final Bomb bomb = Bomb();
//  Random random = Random();
//  List<Flame> flames = [];
//  double flameSpawnTimer = 2;
  GameStatus gameStatus = GameStatus.running;
  BackBtn backBtn = BackBtn();

/*  final textRender = TextPaint(
    style: TextStyle(
      fontSize: 48.0,
      color: BasicPalette.black.color,
    ),
  );*/

  @override
  Future<void> onLoad() async {
    gameStatus = GameStatus.running;
    await add(_world);
    bomb.anchor = Anchor.center;
    await add(bomb);
    bomb.position = Vector2(size.x / 2, size.y / 2);
    bomb.size = Vector2.all(size.y / 6);
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
