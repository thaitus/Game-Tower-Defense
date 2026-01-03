import 'package:flutter/material.dart';
import 'main_menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _currentLog = "> INITIALIZING LEGACY PROTOCOL...";
  
  // Danh sách log hệ thống để chạy cho ngầu
  final List<String> _systemLogs = [
    "> INITIALIZING LEGACY PROTOCOL...",
    "> LOADING JARVIS CORE...",
    "> SCANNING DEFENSE GRID...",
    "> SYNCING GUARDIAN DATA...",
    "> READY. PRESS ANY KEY.", // Dòng cuối cùng
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Thời gian load 4 giây cho "khét"
    )..addListener(() {
        // Cập nhật text log theo tiến trình
        int index = (_controller.value * (_systemLogs.length - 1)).floor();
        if (_currentLog != _systemLogs[index]) {
          setState(() {
            _currentLog = _systemLogs[index];
          });
        }
      });

    _controller.forward().then((_) {
      // Load xong thì chuyển vào Menu chính
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainMenuScreen()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double barWidth = 300; // Độ dài thanh progress bar

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Hiệu ứng Aura mờ ở các góc màn hình cho giống ảnh mẫu
          Positioned(
            top: -100, left: -100,
            child: _buildAuraCircle(Colors.cyanAccent.withValues(alpha: 0.1)),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- LOGO GAME (Full Code Aura) ---
                _buildLogo(),
                
                const SizedBox(height: 100),

                // --- KHU VỰC LOADING (Mascot + Bar + Log) ---
                SizedBox(
                  width: barWidth,
                  child: Column(
                    children: [
                      // 1. Con Mascot (Drone) chạy theo Progress
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: _controller.value * (barWidth - 40)),
                            child: const Icon(
                              Icons.rocket_launch, // Mascot tạm thời bằng Icon cho nhẹ
                              color: Colors.cyanAccent,
                              size: 30,
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 5),

                      // 2. Thanh Progress Bar Cyan Neon
                      Container(
                        height: 12,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.cyanAccent, width: 1.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return LinearProgressIndicator(
                              value: _controller.value,
                              backgroundColor: Colors.transparent,
                              color: Colors.cyanAccent,
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 3. Console Logs bên dưới
                      Text(
                        _currentLog,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Courier', // Kiểu chữ máy tính
                          fontSize: 12,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Chú thích v2.1 ở góc
          const Positioned(
            bottom: 20, left: 20,
            child: Text("LEGACY PROTOCOL v2.1", 
              style: TextStyle(color: Colors.white24, fontSize: 10)),
          ),
        ],
      ),
    );
  }

  // Hàm vẽ Logo chữ "Aura" bằng code
  Widget _buildLogo() {
    return Column(
      children: [
        Text(
          'GUARDIAN',
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
            shadows: [
              Shadow(color: Colors.red.withValues(alpha: 0.8), blurRadius: 15),
            ],
          ),
        ),
        Text(
          'DEFENSE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 8,
            shadows: [
              Shadow(color: Colors.redAccent.withValues(alpha: 0.5), blurRadius: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAuraCircle(Color color) {
    return Container(
      width: 300, height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: color, blurRadius: 100, spreadRadius: 50)],
      ),
    );
  }
}