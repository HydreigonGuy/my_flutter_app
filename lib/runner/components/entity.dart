import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

import 'package:my_app/runner/runner_game.dart';

class Entity extends SpriteAnimationComponent with HasGameRef<RunnerGame>{
  // display
  String imagePath;
  final double _animationSpeed = 0.3;
  late final SpriteAnimation _standingAnimation;

  // todo : take size in constructor to display larger enemies
  Entity(
    this.imagePath,
    Vector2? spawnPos
    ) : super(
    priority: 2,
    size: Vector2.all(80.0),
    position: spawnPos,
  );

  @override
  Future<void> onLoad() async {
    _loadAnimations().then((_) => {animation = _standingAnimation});
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load(imagePath),
      srcSize: Vector2(16.0, 16.0),
    );
    _standingAnimation
    = spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 2);
  }
}
