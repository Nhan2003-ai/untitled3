import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManHinhDangNhap(),
    );
  }
}

class ManHinhDangNhap extends StatefulWidget {
  @override
  _ManHinhDangNhapState createState() => _ManHinhDangNhapState();
}

class _ManHinhDangNhapState extends State<ManHinhDangNhap> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _dangNhap() {
    if (_formKey.currentState!.validate()) {
      // Chuyển sang màn hình khác nếu tất cả điều kiện hợp lệ
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ManHinhChinh(tenNguoiDung: _emailController.text),
        ),
      );
    } else {
      // Hiển thị hộp thoại cảnh báo nếu nhập liệu không hợp lệ
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lỗi đăng nhập'),
            content: Text('Email hoặc mật khẩu không hợp lệ. Vui lòng kiểm tra lại.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Đóng'),
              ),
            ],
          );
        },
      );
    }
  }

  String? _kiemTraEmail(String? giaTri) {
    if (giaTri == null || giaTri.isEmpty) {
      return 'Vui lòng nhập email';
    }
    final bieuThucEmail = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!bieuThucEmail.hasMatch(giaTri)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? _kiemTraMatKhau(String? giaTri) {
    if (giaTri == null || giaTri.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    } else if (giaTri.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đăng nhập')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: _kiemTraEmail,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Mật khẩu'),
                obscureText: true,
                validator: _kiemTraMatKhau,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _dangNhap,
                child: Text('Đăng nhập'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


