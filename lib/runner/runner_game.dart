
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'dart:math';

import 'components/world.dart';
import 'components/player.dart';
import 'components/wall.dart';

class RunnerGame extends FlameGame with HasCollisionDetection, TapDetector {
  final World _world = World();
  final Player player = Player();
  Random random = Random();
  List<Wall> walls = [];
  double wallSpawnTimer = 2;
  bool jumping = false;
  double jumpingVelocity = 0;

  @override
  Future<void> onLoad() async {
    await add(_world);
    player.anchor = Anchor.center;
    await add(player);
    player.position = Vector2(size.x / 8, size.y * 4 / 5);
    player.size = Vector2.all(size.y / 6);
  }

  @override
  void update(double delta) {
    super.update(delta);
  
    if (jumping) {
      jumpingVelocity += delta;
      player.position.y = ((size.y / 4) * jumpingVelocity * jumpingVelocity) + (size.y / 4);
      //print("pos: ${player.position.y}");
      if (player.position.y >= size.y * 4 / 5) {
        player.position.y = size.y * 4 / 5;
        jumping = false;
      }
    }
    wallSpawnTimer -= delta;
    if (wallSpawnTimer <= 0) {
      _spawnWall();
      wallSpawnTimer = 2 + random.nextDouble() * 4;
    }
  }

  @override
  bool onTapDown(TapDownInfo info) {
    if (!jumping) {
      jumping = true;
      jumpingVelocity = -(size.y / 500);
    }
    return true;
  }

  void _spawnWall() {
    Wall newWall = Wall();
    double height = size.y / 10 + size.y * random.nextDouble() / 6;
    newWall.position = Vector2(size.x, size.y * 7 / 8 - height);
    newWall.size = Vector2(size.y / 30, height);
    add(newWall);
    walls.add(newWall);
  }

}
