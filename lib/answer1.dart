import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรไฟล์ผู้ใช้"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // รูปโปรไฟล์แบบวงกลม
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png'),
          ),
          const SizedBox(height: 10),
          // ชื่อผู้ใช้และอีเมล
          const Text(
            "ชื่อผู้ใช้: John Doe",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            "อีเมล: johndoe@example.com",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // เมนูการตั้งค่า
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.blue),
            title: const Text("การตั้งค่า"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.blue),
            title: const Text("เปลี่ยนรหัสผ่าน"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.blue),
            title: const Text("ความเป็นส่วนตัว"),
            onTap: () {},
          ),

          const SizedBox(height: 10),

          // ปุ่มแก้ไขโปรไฟล์และออกจากระบบ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 120),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => showSnackbar(context, "แก้ไขโปรไฟล์"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text("แก้ไขโปรไฟล์"),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => showSnackbar(context, "ออกจากระบบ"),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text("ออกจากระบบ"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
