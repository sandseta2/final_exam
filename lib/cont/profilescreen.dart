import 'package:flutter/material.dart';

// สร้าง Custom Widget ProfileCard
class ProfileCard extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final String imageUrl;
  final String aboutme;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.position,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
    required this.aboutme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      shadowColor: const Color.fromARGB(255, 215, 180, 180).withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // รูปโปรไฟล์
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(height: 12),
            // ชื่อและตำแหน่ง
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              position,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            // อีเมล
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, size: 16, color: Colors.blue),
                const SizedBox(width: 4),
                Text(email),
              ],
            ),
            const SizedBox(height: 4),
            // เบอร์โทร
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.green),
                const SizedBox(width: 4),
                Text(phoneNumber),
              ],
            ),
            // เกี่ยวกับตัวเอง
            Text(
              aboutme,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              position,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
