import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';

import 'package:workout_app/views/adminHome.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/header.dart';
import 'package:get/get.dart';

import '../style/styling.dart';

class AddPerson extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddPersonState();
  }
}

class AddPersonState extends State<AddPerson> {
  final keyIdForm = GlobalKey<FormState>();

  int selectedValue;
  String id;
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
                    height: MediaQuery.of(context).size.height * 0.9,
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
                          Expanded(flex: 2, child: Header()),
                          Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'addtitle'.tr,
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
                                  SizedBox(height: 50),
                                  Form(
                                    key: keyIdForm,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please Enter Id';
                                        } else if (value.length != 14) {
                                          return 'Error Input !!';
                                        } else {
                                          return null;
                                        }
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
                                  ),
                                  SizedBox(height: 50),
                                  RadioListTile(
                                      value: 1,
                                      groupValue: selectedValue,
                                      activeColor: Colors.red,
                                      title: Text(
                                        'addbody1'.tr,
                                        style: new TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          selectedValue = val;
                                        });
                                      }),
                                  RadioListTile(
                                      value: 3,
                                      groupValue: selectedValue,
                                      activeColor: Colors.yellowAccent,
                                      title: Text(
                                        'addbody2'.tr,
                                        style: new TextStyle(
                                          color: Colors.yellowAccent,
                                        ),
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          selectedValue = val;
                                        });
                                      }),
                                  RadioListTile(
                                      value: 4,
                                      groupValue: selectedValue,
                                      activeColor: Colors.green,
                                      title: Text(
                                        'addbody3'.tr,
                                        style: new TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          selectedValue = val;
                                        });
                                      }),
                                ],
                              )),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Button(
                                    border: true,
                                    btnTxt: 'aibutton'.tr,
                                    borderColor: AppColor.pColor,
                                    onTap: () {
                                      final format = keyIdForm.currentState;

                                      if (format.validate()) {
                                        format.save();
                                        if (selectedValue == null) {
                                          _showMyDialog();
                                        } else {
                                          adminState(selectedValue);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdminHome()));
                                        }
                                      }
                                    }),
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

  Future<void> adminState(int s) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('${await returnIdDoc(id)}')
        .update({'status': s}).then((result) {
      print("new USer true");
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  Future<String> returnIdDoc(String id) async {
    String nam;
    await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) async {
                nam = doc.id;
              })
            });
    return nam;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attention!!\n\nPlease Select state...'),
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
