import 'package:flutter/material.dart';
import '../../game/tower_defense_game.dart';

class TutorialOverlay extends StatelessWidget {
  final TowerDefenseGame game;
  const TutorialOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8), // Làm mờ tối hẳn để nổi bật hướng dẫn
      child: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF0D0D0D),
            border: Border.all(color: Colors.cyanAccent, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'CHỈ THỊ TỪ JARVIS',
                style: TextStyle(color: Colors.cyanAccent, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Chào Summoner! Cổng Đỏ đã mở. Hãy chạm vào các vị trí chiến lược để triệu hồi Guardian bảo vệ Base. Đừng để máu về 0!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan[800]),
                  onPressed: () {
                    // Khi bấm "Đã rõ", tắt tutorial và chạy game
                    game.overlays.remove('tutorial');
                    game.resumeEngine();
                  },
                  child: const Text('TÔI ĐÃ RÕ', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}