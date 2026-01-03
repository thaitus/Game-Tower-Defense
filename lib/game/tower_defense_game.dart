// Lớp game chính
// Khởi tạo hệ thống đường đi và hệ spawn wave
// Quản lý máu căn cứ và trạng thái thua trận

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import '../core/services/save_service.dart';
import 'systems/path_manager.dart';
import 'systems/wave_spawner.dart';
import 'components/enemy_component.dart';

class TowerDefenseGame extends FlameGame with HasCollisionDetection {
  late PathManager pathManager;
  late WaveSpawner waveSpawner;

  final ValueNotifier<int> baseHealth = ValueNotifier<int>(10);
  final int _initialHealth = 10; // Đặt một hằng số để dễ quản lý

  // Điều kiện thắng: Sống sót qua 3 wave (ông có thể sửa thành 5 hoặc 10 tùy ý)
  final int maxWaves = 3;
  bool isGameOver = false;

  Future<void> onLoad() async {
    await super.onLoad();
    pathManager = PathManager(size);
    waveSpawner = WaveSpawner(game: this, pathManager: pathManager);
    add(waveSpawner);

    if (SaveService().isFirstTime()) {
      pauseEngine();
      overlays.add('tutorial');
      await SaveService().setFirstTimeCompleted();
    }
  }

  ValueNotifier<int> get wave =>
      isLoaded ? waveSpawner.currentWave : ValueNotifier<int>(1);
  ValueNotifier<int> get enemiesAlive =>
      isLoaded ? waveSpawner.enemiesAlive : ValueNotifier<int>(0);
  ValueNotifier<int> get score =>
      isLoaded ? waveSpawner.score : ValueNotifier<int>(0);

  void onEnemyReachedBase() {
    if (isGameOver) return;

    baseHealth.value--;

    if (baseHealth.value <= 0) {
      _handleEndGame(isWin: false);
    } else {
      // Chỉ check win nếu game đã load xong spawner
      if (isLoaded) {
        checkWinCondition();
      }
    }
  }

  // Logic kiểm tra thắng cuộc
  void checkWinCondition() {
    if (isGameOver) return;
    // Nếu wave hiện tại đã là wave cuối và không còn quái trên bàn
    if (wave.value >= maxWaves && enemiesAlive.value <= 0) {
      _handleEndGame(isWin: true);
    }
  }

  void _handleEndGame({required bool isWin}) {
    isGameOver = true;
    
    // Chỉ lưu điểm và hiện Overlay nếu game đang chạy thật (isLoaded = true)
    if (isLoaded) {
      pauseEngine();
      SaveService().saveHighScore(score.value);
      if (isWin) {
        overlays.add('victory');
      } else {
        overlays.add('defeat');
      }
    }
  }

  // Hàm mở Pause Menu (GDD yêu cầu)
  void pauseGame() {
    if (!isGameOver) {
      pauseEngine();
      overlays.add('pause');
    }
  }

  void resumeGame() {
    overlays.remove('pause');
    resumeEngine();
  }

  void restartGame() {
    // 1. Kiểm tra an toàn trước khi truy cập children hoặc spawner
    if (isLoaded) {
      children.whereType<EnemyComponent>().forEach((e) => e.removeFromParent());
      waveSpawner.reset();
      overlays.removeAll(['defeat', 'victory', 'pause', 'tutorial']);
      resumeEngine();
    }

    // 2. Logic cốt lõi luôn phải reset để Unit Test kiểm tra được
    baseHealth.value = _initialHealth;
    isGameOver = false;
  }
}
