// HUD hiển thị trên đầu màn hình
// Thể hiện trạng thái trận đấu: wave, số quái, máu căn cứ, điểm, nút tạm dừng

import 'package:flutter/material.dart';
import '../../game/tower_defense_game.dart';

class HudOverlay extends StatelessWidget {
  final TowerDefenseGame game;

  const HudOverlay({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cột bên trái: thông tin chiến trường
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Guardian Defense',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Dòng Wave
                ValueListenableBuilder<int>(
                  valueListenable: game.wave,
                  builder: (context, value, _) {
                    return Text('Wave: $value');
                  },
                ),

                // Dòng Quái còn
                ValueListenableBuilder<int>(
                  valueListenable: game.enemiesAlive,
                  builder: (context, value, _) {
                    return Text('Quái còn: $value');
                  },
                ),

                // Dòng máu căn cứ
                ValueListenableBuilder<int>(
                  valueListenable: game.baseHealth,
                  builder: (context, value, _) {
                    return Text('Máu căn cứ: $value');
                  },
                ),
              ],
            ),

            // Cột giữa: điểm
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: game.score,
                  builder: (context, value, _) {
                    return Text(
                      'Điểm: $value',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),

            // Cột phải: nút tạm dừng
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    // Thay vì check game.paused cũ
                    // Ta gọi hàm pauseGame() trong TowerDefenseGame để nó tự pause và hiện Overlay
                    game.pauseGame();
                  },
                  child: const Text(
                    'TẠM DỪNG',
                    style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
