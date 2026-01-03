// Màn hình Thắng trận (Vibe JASI chúc mừng)
import 'package:flutter/material.dart';
import '../../game/tower_defense_game.dart';

class VictoryOverlay extends StatelessWidget {
  final TowerDefenseGame game;
  const VictoryOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent.withOpacity(0.8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('CHIẾN THẮNG!', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('JARVIS: "Cổng Đỏ đã tạm đóng. Hệ thống an toàn!"', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => game.restartGame(), child: const Text('Chơi lại')),
          ],
        ),
      ),
    );
  }
}