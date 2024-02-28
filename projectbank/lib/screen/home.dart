import 'package:flutter/material.dart';
import 'package:projectbank/screen/login.dart';
import 'package:projectbank/screen/register.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange, // เพิ่มสีพื้นหลังสำหรับ Scaffold
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,100, 20, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/IMG_4745.jpg", height: 500, width: 500),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.person_add),
              label: Text("สร้างบัญชีผู้ใช้", style: TextStyle(fontSize: 35)),
              style: ElevatedButton.styleFrom(
                primary: Colors.amberAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.login),
              label: Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 30)),
              style: ElevatedButton.styleFrom(
                primary: Colors.amberAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

