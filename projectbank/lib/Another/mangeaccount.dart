import 'package:flutter/material.dart';

class MangeAccount extends StatefulWidget {
  const MangeAccount({Key? key});

  @override
  State<MangeAccount> createState() => _MangeAccountState();
}

class _MangeAccountState extends State<MangeAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('จัดการบัญชีผู้ใช้'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.network(
                      'https://scontent.fbkk21-1.fna.fbcdn.net/v/t1.15752-9/429107155_932770948380702_4157112326652910735_n.png?_nc_cat=109&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=DsMv20OnD1sAX9T_ncC&_nc_ht=scontent.fbkk21-1.fna&oh=03_AdTBY4pgoMbrZAb3W2ZWNDDylUAek5YVRjbgV6Wc4DLOSw&oe=65FBD9DE',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Name : ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'ณัฐวัตร บัวพา', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Status : ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'นักศึกษา', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Email : ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: 'ooo@gmail.com', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Password : ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(text: '123456', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
