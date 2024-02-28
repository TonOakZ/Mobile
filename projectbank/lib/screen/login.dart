import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:projectbank/screen/mainscreen.dart';
import 'package:projectbank/firebase_options.dart';
import 'package:projectbank/model/profile.dart';
import 'package:projectbank/screen/calendar.dart';
import 'package:projectbank/screen/home.dart';
import 'package:projectbank/screen/welcome.dart';
import '../model/profile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  get message => null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(title: Text("เข้าสู่ระบบ"),
              backgroundColor: Colors.orangeAccent,  // สีของ AppBar
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            backgroundColor: Colors.white, // ตั้งสีพื้นหลังของ Scaffold
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white, // ตั้งสีพื้นหลังของ Container เป็นสีขาว
                ),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("อีเมล", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "กรุณาป้อนอีเมลด้วยครับ"),
                            EmailValidator(
                                errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (String email) {
                            profile.email = email;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "กรุณาป้อนรหัสผ่านด้วยนะครับ"),
                          obscureText: true,
                          onChanged: (String password) {
                            profile.password = password;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent,
                              // ตั้งสีปุ่มเป็นสีน้ำเงิน
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "ลงชื่อเข้าใช้",
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: profile.email,
                                    password: profile.password,
                                  )
                                      .then((value) {
                                    formKey.currentState?.reset();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MainScreen();
                                        },
                                      ),
                                    );
                                  });
                                } on FirebaseAuthException catch (e) {
                                  Fluttertoast.showToast(
                                    msg: "เข้าสู่ระบบไม่สำเร็จ",
                                    gravity: ToastGravity.CENTER,
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
