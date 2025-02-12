
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';

import 'components/world.dart';
import 'components/player.dart';
import 'components/wall.dart';

class RunnerGame extends FlameGame with HasCollisionDetection {
  final World _world = World();
  final Player player = Player();
  List<Wall> walls = [];
  double wallSpawnTimer = 0;

  @override
  Future<void> onLoad() async {
    await add(_world);
    player.anchor = Anchor.center;
    await add(player);
    player.position = Vector2(size.x / 8, size.y * 4 / 5);
    player.size = Vector2.all(size.y / 6);
    _spawnWall();
  }

  @override
  void update(double delta) {
    super.update(delta);
  
    wallSpawnTimer += delta;
    if (wallSpawnTimer > 1) {
      _spawnWall();
      wallSpawnTimer = 0;
    }
  }

  void _spawnWall() {
    Wall newWall = Wall();
    newWall.position = Vector2(size.x / 2, size.y * 3 / 4);
    newWall.size = Vector2(size.y / 30, size.y / 6);
    add(newWall);
    walls.add(newWall);
  }

}
