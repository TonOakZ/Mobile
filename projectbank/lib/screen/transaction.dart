import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(8),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 30,
                    child: Icon(
                      Icons.monetization_on,
                      size: 90,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    left: 160,
                    top: 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'goal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    top: 60,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '1,000,000',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 130,
                    top: 90,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '500 days left',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 350,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(8),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 40,
                    child: Icon(
                      Icons.wallet,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 37,
                    child: Text(
                      'ฝากเงินจาก KBANK',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 5,
                    child: Text(
                      'กุมภาพันธุ์ 2023',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 350,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(8),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 40,
                    child: Icon(
                      Icons.wallet,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 37,
                    child: Text(
                      'ฝากเงินจาก KBANK',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 5,
                    child: Text(
                      'มกราคม 2023',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 350,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(8),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 40,
                    child: Icon(
                      Icons.wallet,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 37,
                    child: Text(
                      'ฝากเงินจาก KBANK',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 5,
                    child: Text(
                      'ธันวาคม 2022',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
