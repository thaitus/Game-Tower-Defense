import 'package:flutter/material.dart';
import '../../core/services/save_service.dart';
import '../widgets/settings_dialog.dart'; // Đảm bảo đã import file widget dùng chung
import 'game_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final _saveService = SaveService();

  // Hàm gọi SettingsDialog dùng chung
  void _showSettings() {
    showDialog(
      context: context,
      builder: (context) => const SettingsDialog(),
    ).then((_) {
      // Cập nhật lại giao diện MainMenu nếu cần (ví dụ sau khi xóa dữ liệu)
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // --- LOGO ĐỎ AURA ---
                Text(
                  'GUARDIAN DEFENSE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    shadows: [
                      Shadow(
                        color: Colors.red.withValues(alpha: 0.8),
                        blurRadius: 15,
                      ),
                      Shadow(
                        color: Colors.orange.withValues(alpha: 0.5),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'LEGACY PROTOCOL - VERSION 2136',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 80),

                // --- HÀNG NÚT BẤM ---
                _buildMenuButton(
                  label: 'KÍCH HOẠT TRIỆU HỒI',
                  icon: Icons.play_arrow,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const GameScreen()),
                    );
                  },
                  isPrimary: true,
                ),

                const SizedBox(height: 20),
                
                // NÚT CÀI ĐẶT CÓ ICON BÁNH RĂNG
                _buildMenuButton(
                  label: 'CÀI ĐẶT',
                  icon: Icons.settings,
                  onPressed: _showSettings,
                ),

                const SizedBox(height: 20),
                
                _buildMenuButton(
                  label: 'THÔNG TIN',
                  icon: Icons.info_outline,
                  onPressed: () => _showCredits(context),
                ),
              ],
            ),

            // Điểm cao ở dưới
            Positioned(
              bottom: 30,
              child: Text(
                'KỶ LỤC HỆ THỐNG: ${_saveService.getHighScore()}',
                style: const TextStyle(color: Colors.cyanAccent, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cập nhật hàm xây dựng nút bấm có thêm Icon
  Widget _buildMenuButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    bool isPrimary = false,
  }) {
    return Container(
      width: 280,
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isPrimary 
                ? Colors.blueAccent.withValues(alpha: 0.4)
                : Colors.blueAccent.withValues(alpha: 0.1),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ElevatedButton.icon( // Sử dụng .icon để chèn icon vào nút
        icon: Icon(icon, color: Colors.white, size: 20),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(color: Colors.blue, blurRadius: 5)],
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? Colors.blue[900]?.withValues(alpha: 0.8)
              : Colors.black,
          side: const BorderSide(color: Colors.lightBlueAccent, width: 1.5),
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _showCredits(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF0A0A0A),
          shape: Border.all(color: Colors.blueAccent, width: 2),
          title: const Text(
            'LEGACY PROTOCOL INFO',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('CHỈ HUY: Hoàng Thái Tú', style: TextStyle(color: Colors.white)),
              SizedBox(height: 10),
              Text('HỆ THỐNG: JARVIS v2.1', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 10),
              Text('NHIỆM VỤ: Bảo vệ Cây Thế Giới khỏi Cổng Đỏ.', style: TextStyle(color: Colors.white70)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('XÁC NHẬN', style: TextStyle(color: Colors.blueAccent)),
            ),
          ],
        );
      },
    );
  }
}