import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import 'package:my_app/runner/runner_game.dart';

class Wall extends SpriteComponent with CollisionCallbacks, HasGameRef<RunnerGame> {
  
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('wall.png');
    final hitbox = RectangleHitbox();
    add(hitbox);
    return super.onLoad();
  }

  @override
  void update(double delta) {
    super.update(delta);
    if (gameRef.gameStatus == GameStatus.running) {
      position.x = position.x - (delta * gameRef.size.x / 8);
    }
  }

}
