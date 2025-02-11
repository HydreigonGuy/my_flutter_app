
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';

import 'entity.dart';

class Player extends Entity with CollisionCallbacks {
  final double _animationSpeed = 0.3;
  late final SpriteAnimation _standingAnimation;

  Player() : super('player.png', Vector2(100, 100), Vector2(0, 0));
  
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

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other)
  {
    print("you died");
  }

}
