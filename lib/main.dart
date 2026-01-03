// File khởi động ứng dụng Guardian Defense
// Nhiệm vụ: Khởi tạo hệ thống lưu trữ và điều hướng màn hình

import 'package:flutter/material.dart';
import 'package:game_tower_defense/ui/screens/splash_screen.dart';
import 'core/services/save_service.dart';
import 'ui/screens/game_screen.dart';
import 'ui/screens/main_menu_screen.dart';
import 'ui/screens/main_menu_screen.dart'; // Sẽ tạo ở bước tiếp theo

void main() async {
  // 1. Đảm bảo Flutter binding được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Khởi tạo Database cục bộ (SaveService) trước khi chạy App
  final saveService = SaveService();
  await saveService.init();

  runApp(const GuardianDefenseApp());
}

class GuardianDefenseApp extends StatelessWidget {
  const GuardianDefenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guardian Defense',
      debugShowCheckedModeBanner: false,
      // Sử dụng theme Dark để hợp với vibe Sci-fi 2136
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.black,
      ),
      // Tạm thời vẫn để GameScreen, sau khi tạo xong MainMenu ta sẽ đổi home tại đây
      home: const SplashScreen(), 
    );
  }
}