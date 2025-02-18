
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
import 'components/flame.dart';
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
  Random random = Random();
  List<Flame> flames = [];
  double flameSpawnTimer = 2;
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
      // remove clicked flames
      var flame_destroy_counter = 0;
      while(flame_destroy_counter < flames.length){
        if (flames[flame_destroy_counter].clicked) {
          remove(flames[flame_destroy_counter]);
          flames.remove(flames[flame_destroy_counter]);
        } else {
          flame_destroy_counter++;
        }
      }

      // spawn flame
      flameSpawnTimer -= delta * 3;
      if (flameSpawnTimer <= 0) {
        _spawnFlame();
        flameSpawnTimer = 2 + random.nextDouble() * 4;
      }
    }
  }

  void _spawnFlame() {
    Flame newFlame = Flame();
    double side = random.nextDouble();
    if (side < 0.4) {
      newFlame.position = Vector2(size.x * random.nextDouble(), 0);
    } else if (side < 0.8) {
      newFlame.position = Vector2(size.x * random.nextDouble(), size.y);
    } else if (side < 0.9) {
      newFlame.position = Vector2(0, size.y * random.nextDouble());
    } else {
      newFlame.position = Vector2(size.x, size.y * random.nextDouble());
    }
    newFlame.size = Vector2.all(size.y / 12);
    add(newFlame);
    flames.add(newFlame);
  }

  void _goBack() {
    if (buildContext != null) {
      Navigator.pop(buildContext!);
      gameStatus = GameStatus.exited;
    }
  }

}
