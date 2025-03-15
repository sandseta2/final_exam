import 'package:flutter/material.dart';
import 'package:final_exam_650710432/cont/profilescreen.dart'; // นำเข้าไฟล์ ProfileCard

// ฟังก์ชันเริ่มต้นแอป
void main() {
  runApp(const MyApp());
}

// สร้าง MyApp เป็น StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileScreen(),
    );
  }
}

// สร้างหน้าหลัก ProfileScreen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile siriwan'),
        centerTitle: true,
      ),
      body: const Center(
        child: ProfileCard(
          name: 'Siriwan Phoksanit',
          position: 'Third year student 💗',
          email: 'siriwanphoksanit22@email.com',
          phoneNumber: '0941272227',
          imageUrl: 'assets/images/sai.jpg',
          aboutme:
              'ฉันเรียนที่มหาวิทยาลัยศิลปากร คณะวิทยาศาสตร์ เอกเทคโนโลยีสารสนเทศ',
        ),
      ),
    );
  }
}
