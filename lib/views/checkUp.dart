import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/widget/about_button.dart';
import 'app.dart';
import 'package:get/get.dart';

class CheckUp extends StatefulWidget {
  @override
  _CheckUpState createState() => _CheckUpState();
}

class _CheckUpState extends State<CheckUp> {
  var items = [1, "gx"];

  bool value1 = false,
      value2 = false,
      value3 = false,
      value4 = false,
      value5 = false,
      value6 = false,
      value7 = false,
      value8 = false,
      value9 = false,
      value10 = false,
      value11 = false,
      value12 = false;

  int result = 0;

  void onChangeValue(bool val) {
    setState(() {
      value1 = val;
      if (value1) {
        result += 3;
      }
    });
  }

  void onChangeValue2(bool val) {
    setState(() {
      value2 = val;
      if (value2) {
        result += 3;
      }
    });
  }

  void onChangeValue3(bool val) {
    setState(() {
      value3 = val;
      if (value3) {
        result += 3;
      }
    });
  }

  void onChangeValue4(bool val) {
    setState(() {
      value4 = val;
      if (value4) {
        result += 3;
      }
    });
  }

  void onChangeValue5(bool val) {
    setState(() {
      value5 = val;
      if (value5) {
        result += 3;
      }
    });
  }

  void onChangeValue6(bool val) {
    setState(() {
      value6 = val;
      if (value6) {
        result += 3;
      }
    });
  }

  void onChangeValue7(bool val) {
    setState(() {
      value7 = val;
      if (value7) {
        result += 3;
      }
    });
  }

  void onChangeValue8(bool val) {
    setState(() {
      value8 = val;
      if (value8) {
        result += 3;
      }
    });
  }

  void onChangeValue9(bool val) {
    setState(() {
      value9 = val;
      if (value9) {
        result += 3;
      }
    });
  }

  void onChangeValue10(bool val) {
    setState(() {
      value10 = val;
      if (value10) {
        result += 10;
      }
    });
  }

  void onChangeValue11(bool val) {
    setState(() {
      value11 = val;
      if (value11) {
        result += 10;
      }
    });
  }

  void onChangeValue12(bool val) {
    setState(() {
      value12 = val;
      if (value12) {
        result += 10;
      }
    });
  }

  void onClickBtn(int res) {
    setState(() {
      if (res < 9) {
        _showMyDialog('alert1'.tr);
      }
      if (res >= 9 && res < 30) {
        _showMyDialog('alert0'.tr);
        adminState(2);
      }
      if (res >= 30) {
        _showMyDialog('alert2'.tr);
        adminState(2);
      }
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      result = 0;
    });
    print("${items[1]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                backgroundImage(),
                Container(color: AppColor.sColor.withOpacity(0.5)),
                body(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox body(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PadRadius.horizontal - 20),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: ListView(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'title'.tr,
                            style: AppTextStyle.headline32,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _checkRow(
                          text: 'Exhaustion'.tr,
                          val: value1,
                          action: onChangeValue),
                      SizedBox(height: 3),
                      _checkRow(
                          text: 'Fever'.tr,
                          val: value2,
                          action: onChangeValue2),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "dryCough".tr,
                          val: value3,
                          action: onChangeValue3),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "Sore throat".tr,
                          val: value4,
                          action: onChangeValue4),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "Diarrhea".tr,
                          val: value5,
                          action: onChangeValue5),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "a headache".tr,
                          val: value6,
                          action: onChangeValue6),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "Loss of sense of taste".tr,
                          val: value7,
                          action: onChangeValue7),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "Loss of sense of smell:".tr,
                          val: value8,
                          action: onChangeValue8),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "rash : ".tr,
                          val: value9,
                          action: onChangeValue9),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "Difficulty breathing:".tr,
                          val: value10,
                          action: onChangeValue10),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "Chest pain or pressure:".tr,
                          val: value11,
                          action: onChangeValue11),
                      SizedBox(height: 3),
                      _checkRow(
                          text: "Loss of ability to move:".tr,
                          val: value12,
                          action: onChangeValue12),
                      SizedBox(height: 15),
                      Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            AboutButton(
                              text: 'backbtn'.tr,
                              isColoredButton: true,
                              onPress: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Application())),
                            ),
                            AboutButton(
                              isColoredButton: true,
                              text: 'Result'.tr,
                              onPress: () {
                                onClickBtn(result);
                              },
                            )
                          ])),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Row _checkRow({String text, bool val, action}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyle.title25,
        ),
        new Switch(
          value: val,
          onChanged: action,
        ),
      ],
    );
  }

  SizedBox backgroundImage() {
    return SizedBox(
        child: Image.asset(
      'assets/images/hhhhh.png',
      height: 800,
    ));
  }

  Future<void> _showMyDialog(String alertText) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(alertText),
          backgroundColor: AppColor.sColor,
          actions: <Widget>[
            TextButton(
              child: Text('alertConfirm'.tr),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Application()));
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> adminState(int s) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('${await returnIdDoc(ApplicationState.emailUser)}')
        .update({'status': s})
        .then((result) {})
        .catchError((onError) {
          print(onError.toString());
        });
  }

  Future<String> returnIdDoc(String email) async {
    String nam;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) async {
                nam = doc.id;
              })
            });
    return nam;
  }
}
