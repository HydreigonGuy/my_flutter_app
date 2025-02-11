
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'components/world.dart';
import 'components/player.dart';

class RunnerGame extends FlameGame {
  final World _world = World();
  final Player player = Player();
    
  @override
  Future<void> onLoad() async {
    await add(_world);
    player.anchor = Anchor.center;
    await add(player);
    player.position = Vector2(size.x / 8, size.y * 4 / 5);
    player.size = Vector2.all(size.y / 6);
  }

}
