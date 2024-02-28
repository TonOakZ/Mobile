import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class DraggableWidget extends StatelessWidget {
  final String text;

  const DraggableWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(8),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('การแจ้งเตือน'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          DraggableWidget(text: 'Notification 1'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 2'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 3'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 4'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 5'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 6'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 7'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 8'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 9'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 10'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 11'),
          SizedBox(height: 5),
          DraggableWidget(text: 'Notification 12'),
        ],
      ),
    );
  }
}
