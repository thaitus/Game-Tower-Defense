import 'package:flutter_test/flutter_test.dart';
import 'package:game_tower_defense/game/tower_defense_game.dart';

void main() {
  // Test 1: Kiểm tra logic trừ máu
  test('Base Health should decrease when enemy reaches base', () {
    final game = TowerDefenseGame();
    // Gán giá trị mặc định để test logic tính toán
    game.baseHealth.value = 10;
    
    game.onEnemyReachedBase();
    
    // Rubric yêu cầu kiểm thử phần tính toán/logic
    expect(game.baseHealth.value, 9);
  });

  // Test 2: Kiểm tra logic GameOver
  test('Game should be over when health reaches 0', () {
    final game = TowerDefenseGame();
    game.baseHealth.value = 1;
    game.isGameOver = false;

    game.onEnemyReachedBase();

    expect(game.isGameOver, true);
  });

  // Test 3: Kiểm tra logic Reset hệ thống
  test('RestartGame should reset health and game state', () {
    final game = TowerDefenseGame();
    // Giả lập trạng thái đang thua
    game.isGameOver = true;
    game.baseHealth.value = 0;

    // Gọi hàm restartGame mà ông đã viết
    game.restartGame();

    // Kiểm tra xem đã về đúng 10 chưa
    expect(game.baseHealth.value, 10);
    expect(game.isGameOver, false);
  });
}