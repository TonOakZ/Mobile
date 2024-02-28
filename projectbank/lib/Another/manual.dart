import 'package:flutter/material.dart';

class Manual extends StatefulWidget {
  const Manual({super.key});

  @override
  State<Manual> createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('คู่มือ'),
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
                  text: 'การใช้งานแอปพลิเคชันที่เกี่ยวกับการเงินสามารถช่วยให้การจัดการเงินและการวางแผนการเงินของคุณเป็นไปอย่างมีประสิทธิภาพมากขึ้นได้ นี่คือบางขั้นตอนที่คุณสามารถทำเพื่อใช้งานแอปพลิเคชันการเงินได้อย่างมีประสิทธิภาพ  ',
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
