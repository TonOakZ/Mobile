import 'package:flutter/material.dart';
import 'package:projectbank/Another/mangeaccount.dart';
import 'package:projectbank/Another/requirements.dart';
import 'package:projectbank/Another/manual.dart';
import 'package:projectbank/Another/password.dart';

class Another extends StatefulWidget {
  const Another({super.key});

  @override
  State<Another> createState() => _AnotherState();
}

class _AnotherState extends State<Another>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: [
                Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MangeAccount()), // Assuming ManageAccount is the name of your ManageAccount page
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://scontent.fbkk21-1.fna.fbcdn.net/v/t1.15752-9/429107155_932770948380702_4157112326652910735_n.png?_nc_cat=109&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=DsMv20OnD1sAX9T_ncC&_nc_ht=scontent.fbkk21-1.fna&oh=03_AdTBY4pgoMbrZAb3W2ZWNDDylUAek5YVRjbgV6Wc4DLOSw&oe=65FBD9DE'),
                    ),
                    title: Text('ข้อมูลส่วนตัว'),
                    subtitle: Text('จัดการข้อมูลส่วนตัว'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Requirements()),
                    );
                  },
                  leading: Icon(Icons.request_page_sharp),
                  title: Text('ข้อกำหนดและเงื่อนไข'),
                  subtitle: Text('ข้อกำหนดและเงื่อนไข'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Manual()),
                    );
                  },
                  leading: Icon(Icons.book),
                  title: Text('คู่มือ'),
                  subtitle: Text('แนะนำการใช้งาน'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Password()),
                    );
                  },
                  leading: Icon(Icons.vpn_key),
                  title: Text('แก้ไขรหัสผ่าน'),
                  subtitle: Text('เปลี่ยนรหัสผ่าน'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
