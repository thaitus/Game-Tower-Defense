// Overlay hiển thị khi thua trận
// Cho biết wave đạt được, điểm số và nút chơi lại

import 'package:flutter/material.dart';
import '../../game/tower_defense_game.dart';

class DefeatOverlay extends StatelessWidget {
  final TowerDefenseGame game;

  const DefeatOverlay({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Thua trận',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Wave đạt được
              ValueListenableBuilder<int>(
                valueListenable: game.wave,
                builder: (context, value, _) {
                  return Text('Wave đạt được: $value');
                },
              ),

              const SizedBox(height: 8),

              // Điểm số
              ValueListenableBuilder<int>(
                valueListenable: game.score,
                builder: (context, value, _) {
                  return Text('Điểm: $value');
                },
              ),

              const SizedBox(height: 16),

              // Nút chơi lại
              ElevatedButton(
                onPressed: () {
                  game.restartGame();
                },
                child: const Text('Chơi lại'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
