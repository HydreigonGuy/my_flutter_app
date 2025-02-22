import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/sprite.dart';

import 'package:my_app/mine/mine_game.dart';

class Tile extends SpriteAnimationComponent with Tappable, HasGameRef<MineGame> {
  bool clicked = false;
  bool isBomb = false;
  int bombsArround = 0;
  late final SpriteSheet spriteSheet;
  
  @override
  Future<void>? onLoad() async {
    spriteSheet = SpriteSheet(
      image: await await gameRef.images.load('mine_tile.png'),
      srcSize: Vector2(10.0, 10.0),
    );
    animation = spriteSheet.createAnimation(row: 0, stepTime: 1, to: 1);
    return super.onLoad();
  }

  @override
  bool onTapUp(_) {
    clicked = true;
    if (isBomb)
      animation = spriteSheet.createAnimation(row: 10, stepTime: 1, to: 1);
    else
      animation = spriteSheet.createAnimation(row: 1 + bombsArround, stepTime: 1, to: 1);
    return true;
  }

}
