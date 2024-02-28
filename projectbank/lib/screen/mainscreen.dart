import 'package:flutter/material.dart';
import 'package:projectbank/screen/mainhome.dart';
import 'package:projectbank/screen/calendar.dart';
import 'package:projectbank/screen/transaction.dart';
import 'package:projectbank/screen/qrcode.dart';
import 'package:projectbank/screen/notifications.dart';
import 'package:projectbank/screen/calculate.dart';
import 'package:projectbank/Another/another.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentpage = 0;
  List pages = [Home(), Transaction(), Calculate(), TimeDays(), Another()];

  @override
  Widget build(BuildContext context) {
    Widget myNavbar = BottomNavigationBar(
      currentIndex: currentpage,
      onTap: (int index) {
        setState(() {
          currentpage = index;
        });
      },
      backgroundColor: Colors.green, // กำหนดสีพื้นหลังของ BottomNavigationBar
      selectedItemColor: Colors.orange, // กำหนดสีของไอเทมที่ถูกเลือก
      unselectedItemColor: Colors.black, // กำหนดสีของไอเทมที่ไม่ได้เลือก
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled, size: 40),
          label: 'หน้าหลัก',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet, size: 40),
          label: 'ธุรกรรม',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calculate_outlined, size: 40),
          label: 'คำนวณค่าต่างๆ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month, size: 40),
          label: 'วางแผน',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts, size: 40),
          label: 'อื่นๆ',
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
          ),
        ],
      ),
      body: pages[currentpage],
      bottomNavigationBar: myNavbar,
    );
  }
}
