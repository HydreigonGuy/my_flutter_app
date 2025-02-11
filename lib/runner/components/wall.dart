import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import 'package:my_app/runner/runner_game.dart';

class Wall extends SpriteComponent with CollisionCallbacks, HasGameRef<RunnerGame> {
  
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('wall.png');
    return super.onLoad();
  }

}
