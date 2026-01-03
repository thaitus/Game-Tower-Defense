import 'package:flutter/material.dart';
import '../../game/tower_defense_game.dart';
import '../screens/main_menu_screen.dart';
import '../widgets/settings_dialog.dart';

class PauseOverlay extends StatelessWidget {
  final TowerDefenseGame game;
  const PauseOverlay({super.key, required this.game});

  void _showSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const SettingsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.8),
      child: Center(
        child: Container(
          width: 320,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF0D0D0D),
            // --- THÊM VIỀN AURA CHO KHUNG CHÍNH ---
            border: Border.all(color: Colors.cyanAccent.withValues(alpha: 0.5), width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withValues(alpha: 0.15),
                blurRadius: 40,
                spreadRadius: 2,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- CĂN GIỮA VÀ FIX CHỮ TIÊU ĐỀ ---
              const Text(
                'HỆ THỐNG TẠM DỪNG',
                textAlign: TextAlign.center, // Đảm bảo căn giữa tuyệt đối
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Giảm nhẹ cỡ chữ để vừa 1 dòng trên mọi màn hình
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  shadows: [Shadow(color: Colors.cyanAccent, blurRadius: 10)],
                ),
              ),
              const SizedBox(height: 30),

              // 1. CHƠI TIẾP - Xanh lá
              _buildSystemButton(
                label: 'CHƠI TIẾP',
                icon: Icons.play_arrow,
                onPressed: () => game.resumeGame(),
                baseColor: Colors.green[800]!,
                accentColor: Colors.greenAccent,
              ),

              const SizedBox(height: 15),

              // 2. CHƠI LẠI - Vàng cam
              _buildSystemButton(
                label: 'CHƠI LẠI',
                icon: Icons.refresh,
                onPressed: () => game.restartGame(),
                baseColor: Colors.orange[900]!,
                accentColor: Colors.orangeAccent,
              ),

              const SizedBox(height: 15),

              // 3. CÀI ĐẶT - Xám xanh
              _buildSystemButton(
                label: 'CÀI ĐẶT', 
                icon: Icons.settings,
                onPressed: () => _showSettings(context),
                baseColor: Colors.blueGrey[900]!,
                accentColor: Colors.blueGrey[100]!,
              ),

              const SizedBox(height: 15),

              // 4. QUAY VỀ - Đỏ
              _buildSystemButton(
                label: 'QUAY VỀ MENU',
                icon: Icons.exit_to_app,
                onPressed: () {
                  game.pauseEngine();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const MainMenuScreen()),
                    (route) => false,
                  );
                },
                baseColor: Colors.red[900]!,
                accentColor: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // HÀM BUILD NÚT THEO STYLE "KÍCH HOẠT TRIỆU HỒI"
  Widget _buildSystemButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required Color baseColor,
    required Color accentColor,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white, size: 20),
        label: label.isEmpty 
          ? const SizedBox.shrink() 
          : Text(
              label,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: accentColor, blurRadius: 5)],
              ),
            ),
        style: ElevatedButton.styleFrom(
          backgroundColor: baseColor.withValues(alpha: 0.8), // Màu nền đặc
          side: BorderSide(color: accentColor, width: 1.5), // Viền sáng neon
          shape: const RoundedRectangleBorder(),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
      ),
    );
  }
}