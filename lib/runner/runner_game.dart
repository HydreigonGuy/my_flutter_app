
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'components/world.dart';
import 'components/player.dart';
import 'components/wall.dart';

class RunnerGame extends FlameGame {
  final World _world = World();
  final Player player = Player();
  final Wall wall = Wall();
    
  @override
  Future<void> onLoad() async {
    await add(_world);
    player.anchor = Anchor.center;
    await add(player);
    player.position = Vector2(size.x / 8, size.y * 4 / 5);
    player.size = Vector2.all(size.y / 6);
    await add(wall);
    wall.position = Vector2(size.x / 2, size.y * 3 / 4);
    wall.size = Vector2(size.y / 30, size.y / 6);
  }

}
