import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('แจ้งลืมรหัสผ่าน'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'กรุณากรอกอีเมลของคุณเพื่อรีเซ็ตรหัสผ่าน',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'กรุณากรอกอีเมลของคุณ',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // เพิ่มโค้ดสำหรับการรีเซ็ตรหัสผ่านที่นี่
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'รีเซ็ตรหัสผ่าน',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
