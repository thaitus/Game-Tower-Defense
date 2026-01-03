// Hệ thống quản lý wave
// Chịu trách nhiệm spawn enemy theo thời gian và theo từng đợt
// Đồng thời cập nhật số liệu cho HUD (wave, quái còn lại, điểm)

import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';

import '../../core/models/enemy_model.dart';
import '../components/enemy_component.dart';
import 'path_manager.dart';
import '../tower_defense_game.dart';

class WaveSpawner extends Component {
  final PathManager pathManager;
  final TowerDefenseGame game;

  // Các giá trị dùng cho HUD, dùng ValueNotifier để UI lắng nghe
  final ValueNotifier<int> currentWave = ValueNotifier<int>(1);
  final ValueNotifier<int> enemiesAlive = ValueNotifier<int>(0);
  final ValueNotifier<int> score = ValueNotifier<int>(0);

  double spawnTimer = 0;         // đếm thời gian giữa các lần spawn
  double spawnInterval = 1.5;    // mỗi bao lâu spawn 1 enemy
  int enemiesSpawnedInWave = 0;  // đã spawn bao nhiêu con trong wave hiện tại
  int enemiesPerWave = 5;        // mỗi wave có bao nhiêu quái

  WaveSpawner({
    required this.game,
    required this.pathManager,
  });

  @override
  void update(double dt) {
    super.update(dt);

    // Nếu game đã thua thì không spawn nữa
    if (game.isGameOver) {
      return;
    }

    spawnTimer += dt;

    // Chưa đến thời điểm spawn thì bỏ qua
    if (spawnTimer < spawnInterval) {
      return;
    }

    // Reset timer sau khi đủ thời gian
    spawnTimer = 0;

    // Nếu wave hiện tại đã spawn đủ quái, chuyển sang wave mới
    if (enemiesSpawnedInWave >= enemiesPerWave) {
      _nextWave();
      return;
    }

    _spawnEnemy();
  }

  // Tạo enemy mới
  void _spawnEnemy() {
    enemiesSpawnedInWave++;

    // Enemy logic: càng về sau càng trâu và nhanh hơn một chút
    final model = EnemyModel(
      health: 50 + currentWave.value * 10,
      speed: 90 + currentWave.value * 5,
    );

    enemiesAlive.value++; // quái đang có trên map tăng lên

    final enemy = EnemyComponent(
      path: pathManager.path,
      speed: model.speed,
      onReachedEnd: () {
      enemiesAlive.value--;
      game.onEnemyReachedBase();
      // Mỗi khi quái biến mất, check xem đã thắng chưa
      game.checkWinCondition(); 
  },
);

    game.add(enemy);
  }

  // Tăng wave khi wave hiện tại đã hoàn thành
  void _nextWave() {
    if (currentWave.value >= game.maxWaves) {
    // Không tăng wave nữa nếu đã đạt giới hạn trong GDD
    return;
    }
    currentWave.value++;
    enemiesSpawnedInWave = 0;
    enemiesPerWave += 2;
    if (spawnInterval > 0.6) spawnInterval -= 0.1;
  }

  // Hàm reset lại trạng thái wave khi chơi lại
  void reset() {
    currentWave.value = 1;
    enemiesAlive.value = 0;
    score.value = 0;

    spawnTimer = 0;
    spawnInterval = 1.5;
    enemiesSpawnedInWave = 0;
    enemiesPerWave = 5;
  }
}
