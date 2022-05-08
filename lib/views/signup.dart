import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/database/database.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/views/app.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/formRegister.dart';
import 'package:workout_app/widget/header.dart';
import 'package:get/get.dart';

import '../style/styling.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth inst = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  String email, password, name, id, phone;
  Database register = Database();
  Forms fo = Forms();
  bool checkssn;

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
                          Expanded(flex: 1, child: Header()),
                          Expanded(
                            flex: 6,
                            child: ListView(
                              children: [
                                Text(
                                  'stitle'.tr,
                                  textDirection: TextDirection.ltr,
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.pColor,
                                      fontFamily: 'Euclid',
                                      shadows: [
                                        Shadow(
                                          blurRadius: 20.0,
                                          color: AppColor.sColor,
                                          offset: Offset(5.0, 5.0),
                                        ),
                                      ],
                                      fontSize: 43.0),
                                ),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 50),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'v1'.tr;
                                          } else
                                            return null;
                                        },
                                        onSaved: (value) {
                                          email = value;
                                        },
                                        decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'sbody1'.tr),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'v2'.tr;
                                          } else
                                            return null;
                                        },
                                        onSaved: (value) {
                                          name = value;
                                        },
                                        decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'sbody2'.tr),
                                        keyboardType: TextInputType.name,
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'v3'.tr;
                                          } else if (value.length != 11)
                                            return 'v4'.tr;
                                          else
                                            return null;
                                        },
                                        onSaved: (value) {
                                          phone = value;
                                        },
                                        decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'sbody4'.tr),
                                        keyboardType: TextInputType.phone,
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'v5'.tr;
                                          } else if (value.length != 14)
                                            return 'v6'.tr;
                                          else
                                            return null;
                                        },
                                        onSaved: (value) {
                                          id = value;
                                        },
                                        decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'sbody5'.tr),
                                        keyboardType: TextInputType.number,
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'v7'.tr;
                                          } else if (value.length < 6)
                                            return 'v8'.tr;
                                          else
                                            return null;
                                        },
                                        onSaved: (value) {
                                          password = value;
                                        },
                                        decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'sbody6'.tr),
                                        obscureText: true,
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 250),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Button(
                                  border: true,
                                  btnTxt: 'lbody5'.tr,
                                  borderColor: AppColor.pColor,
                                  onTap: () async {
                                    if (formKey.currentState.validate()) {
                                      formKey.currentState.save();
                                      final val = await idCheck(id);
                                      if (!val) {
                                        _showMyDialog('ale'.tr);
                                      } else {
                                        signup();
                                      }
                                    }
                                  },
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

  void signup() async {
    final format = formKey.currentState;
    if (format.validate()) {
      format.save();
      try {
        UserCredential user = await inst.createUserWithEmailAndPassword(
            email: email, password: password);
        addUSer(email, password, name, id, phone);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Application()));
      } catch (e) {
        _showMyDialog('ale2'.tr);
        print(e.toString());
      }
    }
  }

  void addUSer(String email, String password, String name, String id,
      String phone) async {
    await users
        .add({
          'email': email,
          'password': password,
          'name': name,
          'id': id,
          'phone': phone,
          'status': 4,
        })
        .then((value) => print('User added'))
        .catchError((onError) => print('error is ${onError.toString()}'));
  }

  Future<bool> idCheck(String id) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: id)
        .get();
    return result.docs.isEmpty;
  }

  Future<void> _showMyDialog(String alerttext) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alerttext),
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
}
