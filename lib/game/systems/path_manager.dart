// Hệ thống quản lý đường đi cho enemy
// Trách nhiệm: định nghĩa danh sách các điểm mà enemy phải đi qua

import 'package:flame/components.dart';

class PathManager {
  final List<Vector2> path = []; // danh sách các điểm cần đi

  PathManager(Vector2 screenSize) {
    final double w = screenSize.x;
    final double h = screenSize.y;

    // Tạo đường đi cơ bản dạng chữ L
    // Đi từ trái sang phải, sau đó rẽ xuống
    path.add(Vector2(-50, h * 0.3));     // điểm ngoài màn hình trái
    path.add(Vector2(w * 0.3, h * 0.3)); // chạy ngang
    path.add(Vector2(w * 0.3, h * 0.7)); // rẽ xuống
    path.add(Vector2(w * 0.8, h * 0.7)); // chạy tiếp ngang
    path.add(Vector2(w + 50, h * 0.7));  // thoát ra khỏi màn hình
  }
}
