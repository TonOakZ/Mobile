import 'package:flutter/material.dart';

class Requirements extends StatefulWidget {
  const Requirements({super.key});

  @override
  State<Requirements> createState() => _RequirementsState();
}

class _RequirementsState extends State<Requirements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('ข้อกำหนดต่างๆ'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: RichText(
                text: TextSpan(
                  text: 'การใช้งานแอปพลิเคชันการเงินอาจมีเงื่อนไขต่าง ๆ ที่คุณควรทราบก่อนเริ่มการใช้งาน ตัวอย่างเงื่อนไขที่มักพบมีดังนี้ค่าบริการบางแอปพลิเคชันการเงินเสียค่าบริการในการใช้งาน อาจมีการเรียกเก็บค่าธรรมเนียมรายเดือน หรือค่าธรรมเนียมสำหรับฟังก์ชันเพิ่มเติม เช่น การทำธุรกรรมหรือบริการที่เชื่อมต่อกับแอปความเป็นส่วนตัวและความปลอดภัยข้อมูล: แอปพลิเคชันการเงินควรมีนโยบายความเป็นส่วนตัวและความปลอดภัยที่ชัดเจนในการจัดการข้อมูลการเงินของผู้ใช้ ควรตรวจสอบและแน่ใจว่าแอปที่คุณเลือกมีมาตรการความปลอดภัยที่เพียงพอสำหรับความความปลอดภัยของข้อมูลของคุณการเชื่อมต่อกับบัญชีธนาคารและบัตรเครดิต: การเชื่อมต่อบัญชีธนาคารและบัตรเครดิตกับแอปพลิเคชันการเงินอาจมีเงื่อนไขเฉพาะ เช่น การให้สิทธิในการเข้าถึงข้อมูลการเงิน การใช้งานข้อมูลที่เกี่ยวข้อง เป็นต้น',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
