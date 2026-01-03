// lib/ui/screens/game_screen.dart

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../../game/tower_defense_game.dart';
import '../overlays/hud_overlay.dart';
import '../overlays/defeat_overlay.dart';
import '../overlays/victory_overlay.dart'; 
import '../overlays/pause_overlay.dart'; 
import '../overlays/tutorial_overlay.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = TowerDefenseGame();

    return Scaffold(
      body: GameWidget(
        game: game,
        overlayBuilderMap: {
          'hud': (context, gameInstance) => HudOverlay(game: gameInstance as TowerDefenseGame),
          'defeat': (context, gameInstance) => DefeatOverlay(game: gameInstance as TowerDefenseGame),
          'victory': (context, gameInstance) => VictoryOverlay(game: game as TowerDefenseGame),
          'pause': (context, gameInstance) => PauseOverlay(game: gameInstance as TowerDefenseGame),
          'tutorial': (context, gameInstance) => TutorialOverlay(game: gameInstance as TowerDefenseGame),
        },
        initialActiveOverlays: const ['hud'],
      ),
    );
  }
}