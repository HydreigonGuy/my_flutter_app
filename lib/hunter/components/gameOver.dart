
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/rendering.dart';

import 'package:my_app/hunter/hunter_game.dart';

class GameOver extends SpriteComponent with HasGameRef<HunterGame> {
  
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('hunter_go.png');
    return super.onLoad();
  }

}
