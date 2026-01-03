// lib/core/services/save_service.dart
// Lớp quản lý lưu trữ dữ liệu người chơi xuống bộ nhớ máy

import 'package:shared_preferences/shared_preferences.dart';

class SaveService {
  // Biến instance duy nhất (Singleton)
  static final SaveService _instance = SaveService._internal();
  factory SaveService() => _instance;
  SaveService._internal();

  late SharedPreferences _prefs;

  // Khởi tạo service (Cần gọi hàm này lúc main.dart vừa chạy)
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // --- LOGIC LƯU ĐIỂM CAO ---
  int getHighScore() => _prefs.getInt('high_score') ?? 0;

  Future<void> saveHighScore(int score) async {
    int currentHigh = getHighScore();
    if (score > currentHigh) {
      await _prefs.setInt('high_score', score);
    }
  }

  // --- LOGIC ÂM THANH ---
  bool isMuted() => _prefs.getBool('is_muted') ?? false;

  Future<void> setMuted(bool value) async {
    await _prefs.setBool('is_muted', value);
  }

  // --- LOGIC TUTORIAL (LẦN ĐẦU CHƠI) ---
  bool isFirstTime() => _prefs.getBool('is_first_time') ?? true;

  Future<void> setFirstTimeCompleted() async {
    await _prefs.setBool('is_first_time', false);
  }

  // Reset dữ liệu (Dùng cho việc test hoặc xóa game chơi lại)
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}