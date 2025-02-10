
import 'package:flame/game.dart';

import 'components/world.dart';

class RunnerGame extends FlameGame {
  final World _world = World();
    
  @override
  Future<void> onLoad() async {
    await add(_world);
  }

}
