
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/collisions.dart';
import 'package:flame/text.dart';
import 'package:flame/palette.dart';
import 'dart:math';

import 'components/world.dart';
import 'components/player.dart';
import 'components/wall.dart';
import 'components/backbtn.dart';
import 'components/playagainbtn.dart';

enum GameStatus {
  running,
  paused,
  over,
  exited
}

class RunnerGame extends FlameGame with HasCollisionDetection, HasTappables {
  final World _world = World();
  final Player player = Player();
  Random random = Random();
  List<Wall> walls = [];
  double wallSpawnTimer = 2;
  bool jumping = false;
  double jumpingVelocity = 0;
  GameStatus gameStatus = GameStatus.running;
  BackBtn backBtn = BackBtn();
  PlayAgainBtn playAgainBtn = PlayAgainBtn();

  final textRender = TextPaint(
    style: TextStyle(
      fontSize: 48.0,
      color: BasicPalette.black.color,
    ),
  );

  late final gameOverText;

  @override
  Future<void> onLoad() async {
    gameStatus = GameStatus.running;
    await add(_world);
    player.anchor = Anchor.center;
    await add(player);
    player.position = Vector2(size.x / 8, size.y * 4 / 5);
    player.size = Vector2.all(size.y / 6);
    gameOverText = TextComponent(
            text: 'Game Over',
            position: size / 2,
            anchor: Anchor.center,
            textRenderer: textRender,
          );
  }

  @override
  void update(double delta) {
    super.update(delta);

    if (backBtn.clicked && gameStatus != GameStatus.exited) {
      _goBack();
    }

    if (playAgainBtn.clicked) {
      _playAgain();
    }

    if (gameStatus == GameStatus.running) {

      // Game end check
      if (!player.alive) {
        remove(player);
        gameStatus = GameStatus.over;
        add(gameOverText);
        add(backBtn);
        backBtn.position = Vector2.all(0);
        backBtn.size = Vector2.all(size.y / 8);
        add(playAgainBtn);
        playAgainBtn.position = Vector2(size.y / 8, 0);
        playAgainBtn.size = Vector2.all(size.y / 8);
      }
  
      // Jumping
      if (jumping) {
        jumpingVelocity += delta;
        player.position.y = ((size.y / 4) * jumpingVelocity * jumpingVelocity) + (size.y / 4);
        //print("pos: ${player.position.y}");
        if (player.position.y >= size.y * 4 / 5) {
          player.position.y = size.y * 4 / 5;
          jumping = false;
        }
      }

      // Spawn new walls
      wallSpawnTimer -= delta;
      if (wallSpawnTimer <= 0) {
        _spawnWall();
        wallSpawnTimer = 2 + random.nextDouble() * 4;
      }

      // Remove excess walls
      var wall_destroy_counter = 0;
      while(wall_destroy_counter < walls.length){
        if (walls[wall_destroy_counter].position.x < 0) {
          remove(walls[wall_destroy_counter]);
          walls.remove(walls[wall_destroy_counter]);
        } else {
          wall_destroy_counter++;
        }
      }
    }
  }

  @override
  bool onTapDown(a, b) {
    super.onTapDown(a, b);
    if (gameStatus == GameStatus.running) {
      if (!jumping) {
        jumping = true;
        jumpingVelocity = -(size.y / 500);
      }
    }
    return true;
  }

  void _spawnWall() {
    Wall newWall = Wall();
    double height = size.y / 10 + size.y * random.nextDouble() / 6;
    newWall.position = Vector2(size.x, size.y * 7 / 8 - height);
    newWall.size = Vector2(size.y / 30, height);
    add(newWall);
    walls.add(newWall);
  }

  void _goBack() {
    if (buildContext != null) {
      Navigator.pop(buildContext!);
      gameStatus = GameStatus.exited;
    }
  }

  void _playAgain() {
    add(player);
    player.alive = true;
    player.position = Vector2(size.x / 8, size.y * 4 / 5);
    player.size = Vector2.all(size.y / 6);
    jumping = false;
    jumpingVelocity = 0;
    wallSpawnTimer = 2;
    while (walls.length != 0) {
      remove(walls[0]);
      walls.remove(walls[0]);
    }
    remove(playAgainBtn);
    remove(backBtn);
    remove(gameOverText);
    playAgainBtn.clicked = false;
    gameStatus = GameStatus.running;
  }

}
