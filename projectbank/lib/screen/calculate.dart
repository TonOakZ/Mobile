import 'package:flutter/material.dart';
import 'package:projectbank/screen/calculatehomevalue.dart';
import 'package:projectbank/screen/calculatecarvalue.dart';
import 'package:projectbank/screen/calculatecarvalue.dart';
import 'package:projectbank/screen/calculateinterestvalue.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
    body: ListView(
      children: <Widget>[
        Card(
          child: Column(
            children: [
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculateHomeValue()),
                  );
                },
                leading: Icon(Icons.home,size: 30),
                title: Text('ผ่อนบ้าน'),
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculateCarValue()),
                  );
                },
                leading: Icon(Icons.car_crash_sharp,size: 30),
                title: Text('ผ่อนรถ'),
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculateInterestValue()),
                  );
                },
                leading: Icon(Icons.attach_money_sharp,size: 30),
                title: Text('ค่างวดเงินกู้'),
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculateHomeValue()),
                  );
                },
                leading: Icon(Icons.interests,size: 30),
                title: Text('ดอกเบี้ยทบต้น'),
              ),
            ],
          ),
        )
      ],
    ),
    );
  }
}