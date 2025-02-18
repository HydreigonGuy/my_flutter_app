import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import 'package:my_app/hunter/hunter_game.dart';

class Flame extends SpriteComponent with CollisionCallbacks, Tappable, HasGameRef<HunterGame> {
  bool clicked = false;
  
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('hunter_flame.png');
    final hitbox = RectangleHitbox();
    add(hitbox);
    return super.onLoad();
  }

  @override
  void update(double delta) {
    super.update(delta);
    if (gameRef.gameStatus == GameStatus.running) {
      if (position.x < gameRef.size.x / 2) {
        position.x = position.x + (delta * gameRef.size.x / 8);
      } else {
        position.x = position.x - (delta * gameRef.size.x / 8);
      }
      if (position.y < gameRef.size.y / 2) {
        position.y = position.y + (delta * gameRef.size.y / 8);
      } else {
        position.y = position.y - (delta * gameRef.size.y / 8);
      }
    }
  }

  @override
  bool onTap(_) {
    clicked = true;
    return true;
  }

}
