
import 'package:flame/game.dart';

import 'components/world.dart';
import 'components/player.dart';

class RunnerGame extends FlameGame {
  final World _world = World();
  final Player player = Player();
    
  @override
  Future<void> onLoad() async {
    await add(_world);
    await add(player);
  }

}
