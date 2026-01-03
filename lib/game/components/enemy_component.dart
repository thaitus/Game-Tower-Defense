// Thành phần đại diện cho quái trên màn hình
// Quái là một hình tròn, tự di chuyển theo đường path

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class EnemyComponent extends CircleComponent {
  final List<Vector2> path; // đường đi
  final double speed; // tốc độ di chuyển
  final VoidCallback? onReachedEnd; // callback khi quái đi tới cuối đường

  int currentIndex = 0; // đang ở mốc thứ mấy trong path

  EnemyComponent({required this.path, this.speed = 100, this.onReachedEnd})
    : super(
        radius: 18, // kích thước enemy
        paint: Paint()..color = Colors.red,
      );

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Khi spawn thì đặt enemy ở điểm đầu tiên
    position = path.first;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Nếu đã đi hết danh sách điểm thì xem như tới căn cứ
    if (currentIndex >= path.length) {
      // Báo ngược về hệ thống: quái đã chạm căn cứ
      onReachedEnd?.call();
      removeFromParent();
      return;
    }

    // Lấy điểm đích hiện tại
    final target = path[currentIndex];

    // Tính vector hướng đi
    final direction = (target - position);

    // Nếu đã gần tới điểm đích thì chuyển sang điểm tiếp theo
    if (direction.length < 2) {
      currentIndex++;
      return;
    }

    // Chuẩn hóa vector để chỉ còn hướng, không còn độ dài
    direction.normalize();

    // Cập nhật vị trí theo thời gian và tốc độ
    position += direction * speed * dt;
  }
}
