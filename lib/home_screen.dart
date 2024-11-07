import 'package:flutter/material.dart';

class ManHinhChinh extends StatelessWidget {
  final String tenNguoiDung;

  ManHinhChinh({required this.tenNguoiDung});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Màn hình chính')),
      body: Center(
        child: Text('Chào mừng, $tenNguoiDung!'),
      ),
    );
  }
}
