import 'package:flame/components.dart';
import 'package:my_app/runner/runner_game.dart';

class World extends SpriteComponent with HasGameRef<RunnerGame> {

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('bg.png');
    size.y = gameRef.size.y;
    size.x = gameRef.size.y * 200 / 30;
    return super.onLoad();
  }

}
