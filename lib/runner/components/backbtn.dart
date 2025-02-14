
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/rendering.dart';

import 'package:my_app/runner/runner_game.dart';

class BackBtn extends SpriteComponent with Tappable, HasGameRef<RunnerGame> {
  bool clicked = false;
  
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('back.png');
    return super.onLoad();
  }

  @override
  bool onTapUp(_) {
    clicked = true;
    return true;
  }

}
