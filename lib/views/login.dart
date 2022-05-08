import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/views/about.dart';
import 'package:workout_app/views/adminHome.dart';
import 'package:workout_app/widget/bodyText.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/header.dart';
import 'package:get/get.dart';

import 'app.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  static int status;
  static String nameText;

  final keyLogin = GlobalKey<FormState>();
  FirebaseAuth inst = FirebaseAuth.instance;
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height * 0.9,
                    child: Image.asset(
                      'assets/images/hh2.jpg',
                      //fit: BoxFit.fill,
                    )),
                Image.asset(
                  'assets/images/Rectangle.png',
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: PadRadius.horizontal - 15),
                      child: Column(
                        children: [
                          Expanded(flex: 5, child: Header()),
                          Expanded(
                            flex: 9,
                            child: Form(
                              key: keyLogin,
                              child: ListView(
                                //   crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  BodyText(
                                    bodyTxt: 'ltitle'.tr,
                                    isBold: true,
                                    desc: 'wbody'.tr,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'v1'.tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        labelText: 'lbody1'.tr),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'v7'.tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      password = value;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        labelText: 'lbody2'.tr),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('lbody3'.tr,
                                          style: AppTextStyle.body12.copyWith(
                                              color: AppColor.pColor))),
                                  SizedBox(
                                    height: 150,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Button(
                                  border: false,
                                  btnTxt: 'lbody4'.tr,
                                  onTap: () {
                                    if (keyLogin.currentState.validate()) {
                                      keyLogin.currentState.save();
                                      if (email == 'Adminloginemail'.tr &&
                                          password == 'Adminloginpassword'.tr) {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => AdminHome(),
                                          ),
                                        );
                                      } else {
                                        login();
                                      }
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Button(
                                  border: true,
                                  btnTxt: 'lbody5'.tr,
                                  borderColor: AppColor.pColor,
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => About())),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    final format = keyLogin.currentState;
    if (format.validate()) {
      format.save();
      try {
        User result = (await inst.signInWithEmailAndPassword(
                email: email, password: password))
            .user;
        status = await returnStatus(email);
        nameText = await returnName(email);
        print(result.email);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Application(),
        ));
      } catch (e) {
        _showMyDialog();
      }
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('alertv'.tr),
          backgroundColor: AppColor.sColor,
          actions: <Widget>[
            TextButton(
              child: Text('alertConfirm'.tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<int> returnStatus(String emailLogin) async {
    int sta;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: emailLogin)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) async {
                sta = int.parse(doc["status"].toString());
                print(sta);
              })
            });
    return sta;
  }

  static Future<String> returnName(String emailLogin) async {
    String nam;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: emailLogin)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) async {
                nam = doc["name"].toString();
              })
            });
    return nam;
  }
}
