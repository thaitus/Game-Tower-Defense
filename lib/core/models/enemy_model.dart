// Đây là lớp dữ liệu đại diện cho enemy ở tầng logic
// Không phải component hiển thị, chỉ là "não"
// Tách ra để sau này dễ mở rộng và test unit

class EnemyModel {
  int health;
  double speed;

  EnemyModel({
    required this.health,
    required this.speed,
  });
}
