import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class CalculateHomeValue extends StatefulWidget {
  @override
  _CalculateHomeValueState createState() => _CalculateHomeValueState();
}

class _CalculateHomeValueState extends State<CalculateHomeValue> {
  // ตัวแปรสำหรับเก็บค่า
  double _principal = 0.0; // ราคาบ้าน
  double _downPayment = 0.0; // เงินดาวน์
  double _interestRate = 0.0; // อัตราดอกเบี้ย
  double _term = 0.0; // ระยะเวลาการกู้ (ปี)
  double _monthlyPayment = 0.0; // ค่าผ่อนต่อเดือน

  final TextEditingController home = TextEditingController();
  final TextEditingController moneystar = TextEditingController();
  final TextEditingController interest_rate = TextEditingController();
  final TextEditingController loan_period = TextEditingController();
  final TextEditingController monthlyPaymentController = TextEditingController();

  // ฟังก์ชันสำหรับคำนวณค่าผ่อนต่อเดือน
  void _calculateMonthlyPayment() {
    setState(() {
      double loanAmount = _principal - _downPayment;
      double monthlyInterestRate = _interestRate / 12;
      int numberOfPayments = (_term * 12).toInt();

      if (loanAmount <= 0 || monthlyInterestRate <= 0 || numberOfPayments <= 0) {
        _monthlyPayment = 0;
      } else {
        _monthlyPayment = loanAmount * monthlyInterestRate / (1 - (1 / pow(1 + monthlyInterestRate, numberOfPayments)));
      }
    });
  }

  void _clearValues() {
    setState(() {
      _principal = 0.0;
      _downPayment = 0.0;
      _interestRate = 0.0;
      _term = 0.0;
      _monthlyPayment = 0.0;
      home.clear();
      moneystar.clear();
      interest_rate.clear();
      loan_period.clear();
      monthlyPaymentController.clear();
    });
  }

  List<TextInputFormatter> getInputFormatters() {
    return [FilteringTextInputFormatter.digitsOnly];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('คำนวณมูลค่าบ้าน'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // ช่องกรอกข้อมูล
            TextField(
              controller: home,
              decoration: InputDecoration(labelText: 'ราคาบ้าน'),
              keyboardType: TextInputType.number,
              inputFormatters: getInputFormatters(),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: moneystar,
              decoration: InputDecoration(labelText: 'เงินดาวน์'),
              keyboardType: TextInputType.number,
              inputFormatters: getInputFormatters(),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: interest_rate,
              decoration: InputDecoration(labelText: 'อัตราดอกเบี้ย (%)'),
              keyboardType: TextInputType.number,
              inputFormatters: getInputFormatters(),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: loan_period,
              decoration: InputDecoration(labelText: 'ระยะเวลาการกู้ (ปี)'),
              keyboardType: TextInputType.number,
              inputFormatters: getInputFormatters(),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: monthlyPaymentController,
              decoration: InputDecoration(labelText: 'ผ่อนเดือนละกี่บาท'),
              keyboardType: TextInputType.number,
              inputFormatters: getInputFormatters(),
            ),

            // ปุ่มคำนวณ
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _principal = double.tryParse(home.text) ?? 0.0;
                  _downPayment = double.tryParse(moneystar.text) ?? 0.0;
                  _interestRate = double.tryParse(interest_rate.text) ?? 0.0 / 100;
                  _term = double.tryParse(loan_period.text) ?? 0.0;
                  _monthlyPayment = double.tryParse(monthlyPaymentController.text) ?? 0.0;
                  _calculateMonthlyPayment();
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              ),
              child: Text('คำนวณ', style: TextStyle(color: Colors.black),),
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _clearValues,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              ),
              child: Text('เคลียร์', style: TextStyle(color: Colors.black),),
            ),

            // แสดงผลลัพธ์
            SizedBox(height: 16.0),
            Text(
              'ค่าผ่อนต่อเดือน: ${_monthlyPayment.toStringAsFixed(2)} บาท',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),

            // สรุปยอดรวม
            Text(
              'สรุป',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('ราคาบ้าน:'),
                Text('${_principal.toStringAsFixed(2)} บาท'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('เงินดาวน์:'),
                Text('${_downPayment.toStringAsFixed(2)} บาท'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('เงินกู้:'),
                Text('${(_principal - _downPayment).toStringAsFixed(2)} บาท'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('ดอกเบี้ย:'),
                Text('${(_principal - _downPayment) * _interestRate * _term} บาท'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('เงินกู้รวมดอกเบี้ย:'),
                Text('${(_principal - _downPayment) + ((_principal - _downPayment) * _interestRate * _term)} บาท'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
