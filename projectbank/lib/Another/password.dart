import 'package:flutter/material.dart';
import 'package:projectbank/Another/forgotpassword.dart';

class Password extends StatefulWidget {
  const Password({Key? key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('จัดการรหัสผ่าน'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'รหัสผ่านปัจจุบัน',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 20), // Adding space between rows
            TextField(
              decoration: InputDecoration(
                hintText: 'ป้อนรหัสผ่านปัจจุบันของคุณ',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height:20), // Adding space between rows
            Text(
              'รหัสผ่านใหม่',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 20), // Adding space between rows
            TextField(
              decoration: InputDecoration(
                hintText: 'ป้อนรหัสผ่านใหม่ของคุณ',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20), // Adding space between rows// Adding space between rows
            Text(
              'ยืนยันรหัสผ่านใหม่',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 20), // Adding space between rows
            TextField(
              decoration: InputDecoration(
                hintText: 'ยืนยันรหัสผ่านใหม่ของคุณ',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20), // Adding space between rows
            // ตำแหน่งของ TextField สำหรับยืนยันรหัสผ่านใหม่
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // โค้ดสำหรับการยืนยันรหัสผ่าน
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'ยืนยันการเปลี่ยนรหัสผ่าน',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(height: 30), // Adding space between rows
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forgotpassword()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'ลืมรหัสผ่าน',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
