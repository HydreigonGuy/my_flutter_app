import 'package:flame/components.dart';
import 'package:my_app/runner/runner_game.dart';
import '../helpers/map_loader.dart';

class World extends SpriteComponent with HasGameRef<RunnerGame> {

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('bg.png');
    // size = sprite!.originalSize;
    return super.onLoad();
  }

}
