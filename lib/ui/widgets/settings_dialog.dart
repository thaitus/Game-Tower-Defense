import 'package:flutter/material.dart';
import '../../core/services/save_service.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final _saveService = SaveService();
  late bool _isMuted;

  @override
  void initState() {
    super.initState();
    _isMuted = _saveService.isMuted();
  }

  void _confirmReset(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text('XÁC NHẬN XÓA?', style: TextStyle(color: Colors.redAccent)),
        content: const Text(
          'Mọi kỷ lục và hướng dẫn sẽ được reset về trạng thái ban đầu.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('HỦY')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await _saveService.clearAll();
              if (context.mounted) {
                Navigator.pop(context); // Đóng hộp thoại xác nhận
                Navigator.pop(context); // Đóng bảng cài đặt chính
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Dữ liệu hệ thống đã được xóa sạch!')),
                );
              }
            },
            child: const Text('XÓA NGAY'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF0A0A0A),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.cyanAccent, width: 2),
        borderRadius: BorderRadius.circular(0),
      ),
      title: const Row(
        children: [
          Icon(Icons.settings, color: Colors.cyanAccent),
          SizedBox(width: 10),
          Text(
            'THIẾT LẬP HỆ THỐNG',
            style: TextStyle(color: Colors.cyanAccent, fontSize: 18, letterSpacing: 2),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Mục Âm Thanh
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              border: const Border(left: BorderSide(color: Colors.cyanAccent, width: 3)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ÂM THANH', style: TextStyle(color: Colors.white)),
                Switch(
                  value: !_isMuted,
                  activeColor: Colors.cyanAccent,
                  onChanged: (value) async {
                    await _saveService.setMuted(!value);
                    setState(() => _isMuted = !value);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Divider(color: Colors.white24),
          const SizedBox(height: 10),
          const Text(
            'VÙNG NGUY HIỂM',
            style: TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Nút Xóa Dữ Liệu nổi bật
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.redAccent),
                backgroundColor: Colors.redAccent.withValues(alpha: 0.05),
              ),
              icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
              label: const Text('XÓA DỮ LIỆU', style: TextStyle(color: Colors.redAccent)),
              onPressed: () => _confirmReset(context),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('ĐÓNG', style: TextStyle(color: Colors.cyanAccent)),
        ),
      ],
    );
  }
}