import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/views/adminHome.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/header.dart';
import 'package:get/get.dart';

import '../style/styling.dart';

class AddInjuries extends StatefulWidget {
  @override
  _AddInjuriesState createState() => _AddInjuriesState();
}

class _AddInjuriesState extends State<AddInjuries> {
  final fromkeyadmin = GlobalKey<FormState>();
  int _numCases, _numDeaths, _numRecovers;

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
                  ),
                ),
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
                        horizontal: PadRadius.horizontal - 15,
                      ),
                      child: Column(
                        children: [
                          Expanded(flex: 4, child: Header()),
                          Expanded(
                              flex: 6,
                              child: Form(
                                key: fromkeyadmin,
                                child: ListView(
                               //   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'aititle'.tr,
                                      textDirection: TextDirection.ltr,
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.pColor,
                                          fontFamily: 'Euclid',
                                          //backgroundColor: AppColor.sColor,
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
                                    TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'please enter data !!';
                                        } else
                                          return null;
                                      },
                                      onSaved: (value) {
                                        _numCases = int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          labelText: 'aibody1'.tr),
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'please enter data !!';
                                        } else
                                          return null;
                                      },
                                      onSaved: (value) {
                                        _numDeaths = int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          labelText: 'aibody2'.tr),
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'please enter data !!';
                                        } else
                                          return null;
                                      },
                                      onSaved: (value) {
                                        _numRecovers = int.parse(value);
                                      },
                                      decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          labelText: 'aibody3'.tr),
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Button(
                                  border: true,
                                  btnTxt: 'aibutton'.tr,
                                  borderColor: AppColor.pColor,
                                  onTap: () {
                                    if (fromkeyadmin.currentState.validate()) {
                                      fromkeyadmin.currentState.save();
                                      deathsUpdate(_numDeaths);
                                      recoversUpdate(_numRecovers);
                                      casesUpdate(_numCases);
                                      _showMyDialog();
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Setup has been registered Successfully'),
          backgroundColor: AppColor.sColor,
          actions: <Widget>[
            TextButton(
              child: Text('alertConfirm'.tr),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AdminHome()));
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> casesUpdate(int num) async {
    await FirebaseFirestore.instance
        .collection('statistics')
        .doc('info3')
        .update({'injuries': num}).then((result) {
      print("new USer true");
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  Future<void> deathsUpdate(int num) async {
    await FirebaseFirestore.instance
        .collection('statistics')
        .doc('info')
        .update({'deaths': num}).then((result) {
      print("new USer true");
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  Future<void> recoversUpdate(int num) async {
    await FirebaseFirestore.instance
        .collection('statistics')
        .doc('info2')
        .update({'recovers': num}).then((result) {
      print("new USer true");
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
