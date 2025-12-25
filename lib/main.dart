import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(GameWidget(game: Mygame()));
}

class Mygame extends Game{
  @override
  void render(Canvas canvas){
      final paint = Paint()..color = const Color(0xFF00FF00);
      canvas.drawRect(Rect.fromLTWH(50, 50, 100, 100), paint);
  }
  @override
  void update(double dt){}
}