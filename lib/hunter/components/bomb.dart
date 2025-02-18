import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import 'package:my_app/hunter/hunter_game.dart';

class Bomb extends SpriteComponent with CollisionCallbacks, HasGameRef<HunterGame> {
  
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('hunter_bomb.png');
    final hitbox = RectangleHitbox();
    add(hitbox);
    return super.onLoad();
  }

}
