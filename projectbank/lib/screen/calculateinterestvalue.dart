import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'คำนวณดอกเบี้ยทบต้นแอป Flutter',
      home: CalculateInterestValue(),
    );
  }
}

class CalculateInterestValue extends StatefulWidget {
  @override
  _CalculateInterestValueState createState() => _CalculateInterestValueState();
}

class _CalculateInterestValueState extends State<CalculateInterestValue> {
  final TextEditingController principalTextField = TextEditingController();
  final TextEditingController monthlyDepositTextField = TextEditingController();
  final TextEditingController durationTextField = TextEditingController();
  final TextEditingController interestRateTextField = TextEditingController();
  final TextEditingController totalInterestTextField = TextEditingController();
  final TextEditingController totalInvestmentTextField = TextEditingController();

  bool isAnnualCompounding = true;

  double totalInterest = 0.0;
  double principal = 0.0;


  void clearTextFields() {
    principalTextField.clear();
    monthlyDepositTextField.clear();
    durationTextField.clear();
    interestRateTextField.clear();
    totalInterestTextField.text = "0.00";
    totalInvestmentTextField.text = "0.00";
    setState(() {
      totalInterest = 0.00;
      principal = 0.00;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('คำนวณดอกเบี้ยทบต้น'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: principalTextField,
              decoration: InputDecoration(labelText: 'เงินฝากเดิม'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
            ),
            TextField(
              controller: monthlyDepositTextField,
              decoration: InputDecoration(labelText: 'ฝากเดือนละ'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
            ),
            TextField(
              controller: durationTextField,
              decoration: InputDecoration(labelText: 'ระยะเวลา (เดือน)'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
            ),
            TextField(
              controller: interestRateTextField,
              decoration: InputDecoration(labelText: 'อัตราดอกเบี้ย (% ต่อปี)'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
            ),
            DropdownButton<bool>(
              value: isAnnualCompounding,
              onChanged: (bool? value) {
                setState(() {
                  isAnnualCompounding = value!;
                });
              },
              items: <DropdownMenuItem<bool>>[
                DropdownMenuItem(
                  value: true,
                  child: Container(
                    child: Text('ทบต้นรายปี'),
                  ),
                ),
                DropdownMenuItem(
                  value: false,
                  child: Container(
                    child: Text('ทบต้นรายเดือน'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
              ),
              child: Text('คำนวณ'),
              onPressed: () {
                setState(() {
                  principal = double.parse(principalTextField.text);
                  double monthlyDeposit = double.parse(monthlyDepositTextField.text);
                  int duration = int.parse(durationTextField.text);
                  double interestRate = double.parse(interestRateTextField.text);
                  bool isAnnualCompounding = this.isAnnualCompounding;

                  totalInterest = calculateCompoundInterest(principal, monthlyDeposit, duration, interestRate, isAnnualCompounding);

                  // แสดงผลลัพธ์
                  totalInterestTextField.text = totalInterest.toStringAsFixed(2);
                  totalInvestmentTextField.text = (principal + totalInterest).toStringAsFixed(2);
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
              ),
              child: Text('เคลียร์'),
              onPressed: clearTextFields
            ),
            SizedBox(height: 16.0),
            Text(
              'สรุป',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('ดอกเบี้ยทั้งหมด:'),
                Text('${totalInterest.toStringAsFixed(2)} บาท'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('ยอดเงินรวม:'),
                Text('${(principal + totalInterest).toStringAsFixed(2)} บาท'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double calculateCompoundInterest(double principal, double monthlyDeposit, int duration, double interestRate, bool isAnnualCompounding) {
    double totalInterest = 0.0;
    for (int i = 0; i < duration; i++) {
      double interest = principal * interestRate / 100;
      totalInterest += interest;
      if (isAnnualCompounding) {
        principal += interest;
      }
    }
    return totalInterest;
  }
}
