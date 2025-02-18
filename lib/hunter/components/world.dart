import 'package:flame/components.dart';
import 'package:my_app/hunter/hunter_game.dart';

class World extends SpriteComponent with HasGameRef<HunterGame> {

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('runner_bg.png');
    size.y = gameRef.size.y;
    size.x = gameRef.size.y * 200 / 30;
    return super.onLoad();
  }

}
