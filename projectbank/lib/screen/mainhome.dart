import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 140,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Show Money',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -13,
                  right: -15,
                  child: IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.replay),
                    onPressed: () {
                      // รหัสสำหรับการเรียกใช้งาน replay ไอคอน
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black38,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              width: 355,
              height: 260,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '23 กุมภาพันธ์ 2024',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\t\t\t\tนมสด ขนมปังปิ้ง',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\t\t\t\tน้ำอัดลม',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '22 กุมภาพันธ์ 2024',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /*Positioned(
            bottom: MediaQuery.of(context).size.height * 0.02 ,
            left: MediaQuery.of(context).size.width * 0.5 - 55,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(Icons.qr_code_scanner_sharp),
                color: Colors.black,
                iconSize: 90,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanQR()),
                  );
                },
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}


