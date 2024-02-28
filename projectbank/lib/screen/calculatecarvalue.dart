import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class CalculateCarValue extends StatefulWidget {
  @override
  _CalculateCarValueState createState() => _CalculateCarValueState();
}

class _CalculateCarValueState extends State<CalculateCarValue> {
  // ตัวแปรสำหรับเก็บค่า
  double _principal = 0.0; // ราคารถ
  double _downPayment = 0.0; // เงินดาวน์
  double _interestRate = 0.0; // อัตราดอกเบี้ย
  double _term = 0.0; // ระยะเวลาการกู้ (ปี)
  double _monthlyPayment = 0.0; // ค่าผ่อนต่อเดือน

  final TextEditingController principalController = TextEditingController();
  final TextEditingController downPaymentController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController termController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('คำนวณมูลค่ารถ'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: principalController,
                decoration: InputDecoration(labelText: 'ราคารถ'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // อนุญาตให้ป้อนตัวเลขเท่านั้น
                ],
                onChanged: (value) {
                  setState(() {
                    _principal = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: downPaymentController,
                decoration: InputDecoration(labelText: 'เงินดาวน์'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // อนุญาตให้ป้อนตัวเลขเท่านั้น
                ],
                onChanged: (value) {
                  setState(() {
                    _downPayment = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: interestRateController,
                decoration: InputDecoration(labelText: 'อัตราดอกเบี้ย (%)'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // อนุญาตให้ป้อนตัวเลขเท่านั้น
                ],
                onChanged: (value) {
                  setState(() {
                    _interestRate = double.tryParse(value) ?? 0.0 / 100;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: termController,
                decoration: InputDecoration(labelText: 'ระยะเวลาการกู้ (ปี)'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // อนุญาตให้ป้อนตัวเลขเท่านั้น
                ],
                onChanged: (value) {
                  setState(() {
                    _term = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: monthlyPaymentController,
                decoration: InputDecoration(labelText: 'ผ่อนเดือนละกี่บาท'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // อนุญาตให้ป้อนตัวเลขเท่านั้น
                ],
                onChanged: (value) {
                  setState(() {
                    _monthlyPayment = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculateMonthlyPayment,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                ),
                child: Text('คำนวณ'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // เคลียร์ค่าทุกตัวแปรเก็บค่า
                    _principal = 0.0;
                    _downPayment = 0.0;
                    _interestRate = 0.0;
                    _term = 0.0;
                    _monthlyPayment = 0.0;

                    // เคลียร์ค่าใน TextField
                    principalController.clear();
                    downPaymentController.clear();
                    interestRateController.clear();
                    termController.clear();
                    monthlyPaymentController.clear();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                ),
                child: Text('เคลียร์'),
              ),
              SizedBox(height: 16.0),
              Text(
                'ค่าผ่อนต่อเดือน: ${_monthlyPayment.toStringAsFixed(2)} บาท',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              Text(
                'สรุป',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('ราคารถ:'),
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
      ),
    );
  }
}
