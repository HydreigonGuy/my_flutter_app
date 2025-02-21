import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import 'package:my_app/mine/mine_game.dart';

class Tile extends SpriteComponent with Tappable, HasGameRef<MineGame> {
  bool clicked = false;
  bool isBomb = false;
  
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('mine_default_tile.png');
    return super.onLoad();
  }

  @override
  bool onTapUp(_) {
    clicked = true;
    return true;
  }

}
