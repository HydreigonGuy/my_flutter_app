
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/rendering.dart';

import 'package:my_app/mine/mine_game.dart';

class PlayAgainBtn extends SpriteComponent with Tappable, HasGameRef<MineGame> {
  bool clicked = false;
  
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('play_again.png');
    return super.onLoad();
  }

  @override
  bool onTapUp(_) {
    clicked = true;
    return true;
  }

}
