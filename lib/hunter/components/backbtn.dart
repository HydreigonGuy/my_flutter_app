
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/rendering.dart';

import 'package:my_app/hunter/hunter_game.dart';

class BackBtn extends SpriteComponent with Tappable, HasGameRef<HunterGame> {
  bool clicked = false;
  
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('runner_back.png');
    return super.onLoad();
  }

  @override
  bool onTapUp(_) {
    clicked = true;
    return true;
  }

}
