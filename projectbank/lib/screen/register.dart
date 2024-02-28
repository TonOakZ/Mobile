import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:projectbank/firebase_options.dart';
import 'package:projectbank/model/profile.dart';
import 'package:projectbank/screen/home.dart';




class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context,snapshot){
          if (snapshot.hasError){
            return Scaffold(
              appBar: AppBar(title: Text("Error"),
              ),
              body: Center(child: Text("${snapshot.error}"),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return Scaffold(
              appBar: AppBar(title: Text("สร้างบัญชีผู้ใช้"),
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
                ),// จัดกลางตำแหน่งของ Title
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("อีเมล", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "กรุณาป้อนอีเมลด้วยครับ"),
                              EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
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
                                  borderSide: BorderSide(color: Colors.black)
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "กรุณาป้อนรหัสผ่านด้วยนะครับ"
                            ),
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
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                              ),
                              child: Text("ลงทะเบียน", style: TextStyle(fontSize: 15)),
                              onPressed: () async{
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  try{
                                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                        email: profile.email,
                                        password: profile.password
                                    ).then((value){
                                      formKey.currentState!.reset();
                                      Fluttertoast.showToast(
                                          msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                          gravity: ToastGravity.TOP
                                      );
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context){
                                            return HomeScreen();
                                          }));
                                    });
                                  }on FirebaseAuthException catch(e){
                                    print(e.code);
                                    String message;
                                    if (e.code == 'email-already-in-use') {
                                      message = "มีอีเมลนี้ในระบบแล้วครับโปรดใช้อีเมลอื่นแทน";
                                    } else if (e.code == 'weak-password') {
                                      message = "รหัสผ่่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                                    } else {
                                      message = e.message ?? "ไม่สามารถระบุข้อผิดพลาดได้";
                                    }
                                    Fluttertoast.showToast(
                                      msg: message,
                                      gravity: ToastGravity.CENTER,
                                    );
                                  }
                                }
                              },
                            ),
                          )
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
        });
  }
}

