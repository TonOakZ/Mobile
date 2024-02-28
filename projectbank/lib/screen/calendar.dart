import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimeDays(),
    );
  }
}

class TimeDays extends StatefulWidget {
  const TimeDays({Key? key}) : super(key: key);

  @override
  State<TimeDays> createState() => _TimeDaysState();
}

class _TimeDaysState extends State<TimeDays> {
  DateTime today = DateTime.now();
  DateTime? selectedDay;
  Map<DateTime, TextEditingController> detailControllers = {};
  Map<DateTime, List<String>> savedDetails = {};
  double totalMoney = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 20),
              lastDay: DateTime.utc(2040, 10, 20),
              focusedDay: DateTime.now(),
              headerVisible: true,
              daysOfWeekVisible: true,
              sixWeekMonthsEnforced: true,
              shouldFillViewport: false,
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w800,
                ),
              ),
              calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.amberAccent,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  this.selectedDay = selectedDay;
                });

                // สร้าง TextEditingControllers และ List ที่เก็บรายละเอียดของวันนี้
                if (!detailControllers.containsKey(selectedDay!)) {
                  detailControllers[selectedDay!] = TextEditingController();
                  savedDetails[selectedDay!] = [];
                }
              },
            ),
            if (selectedDay != null) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'วันที่: ${selectedDay!.day}/${selectedDay!.month}/${selectedDay!.year}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: detailControllers[selectedDay!],
                  decoration: InputDecoration(
                    labelText: 'รายละเอียด',
                  ),
                ),
              ),
    ElevatedButton(
    onPressed: () {
    String detail = detailControllers[selectedDay!]!.text;
    print('บันทึกละเอียด: $detail ในวันที่: ${selectedDay!.day}/${selectedDay!.month}/${selectedDay!.year}');

    // เพิ่มข้อมูลลงใน Firestore
    FirebaseFirestore.instance.collection('financial_details').add({
    'date': selectedDay!,
    'detail': detail,
    });

    // ล้างค่าใน TextFormField
    detailControllers[selectedDay!]!.clear();
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.amberAccent,
    textStyle: TextStyle(color: Colors.white),
    ),
    child: Text('บันทึก'),
    ),
            ],
            if (selectedDay != null && savedDetails.containsKey(selectedDay!)) ...[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    child: ListView.builder(
                      itemCount: savedDetails[selectedDay!]!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(savedDetails[selectedDay!]![index]),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}