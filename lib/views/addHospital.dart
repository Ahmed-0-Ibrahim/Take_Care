import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/header.dart';
import 'package:get/get.dart';

import '../style/styling.dart';

class AddHospital extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddHospitalState();
  }
}

class AddHospitalState extends State<AddHospital> {
  FirebaseAuth inst = FirebaseAuth.instance;
  CollectionReference hospital =
      FirebaseFirestore.instance.collection('hospital');
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final formKeyhos = GlobalKey<FormState>();
  static List geovermates = [
    'Alexandria Governorate'.tr,
    'Asyut Governorate'.tr,
    'Aswan Governorate'.tr,
    'Beheira Governorate'.tr,
    'Beni Suef Governorate'.tr,
    'Cairo Governorate'.tr,
    'Dakahlia Governorate'.tr,
    'Faiyum Governorate'.tr,
    'Gharbia Governorate'.tr,
    'Giza Governorate'.tr,
    'Helwan Governorate'.tr,
    'Ismailia Governorate'.tr,
    'Kafr el-Sheikh Governorate'.tr,
    'Luxor Governorate'.tr,
    'Matruh Governorate'.tr,
    'Monufia Governorate'.tr,
    'Minya Governorate'.tr,
    'New Valley Governorate'.tr,
    'North Sinai Governorate'.tr,
    'Port Said Governorate'.tr,
    'Qena Governorate'.tr,
    'Qalyubia Governorate'.tr,
    'Red Sea Governorate'.tr,
    'Suez Governorate'.tr,
    'Sohag Governorate'.tr,
    'Sharqia Governorate'.tr,
    '6th of October Governorate'.tr,
  ];
  String selectedGeovermate = 'Cairo Governorate'.tr;
  String _namehospital, _hospitallocation;
  int _hospitalcapacity, _busybeds, _carecapacity, _careavailable, _phone;

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
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      'assets/images/hh.png',
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Container(color: AppColor.sColor.withOpacity(0.8)),
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
                          Expanded(
                              flex: 2,
                              child: Column(children: [
                                Header(),
                                Text(
                                  'Add Hospital'.tr,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.pColor,
                                    fontFamily: 'Euclid',
                                    fontSize: 30,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.white,
                                        offset: Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ])),
                          Expanded(
                              flex: 6,
                              child: ListView(
                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      'Select the Governorate'.tr,
                                      style: TextStyle(
                                        color: AppColor.pColor,
                                        fontFamily: 'Euclid',
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Form(
                                    key: formKeyhos,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          // width: 350,
                                          child: DropdownButton(
                                            dropdownColor: AppColor.sColor,
                                            items:
                                                geovermates.map((geovermate) {
                                              return DropdownMenuItem(
                                                value: geovermate,
                                                child: Text(geovermate),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedGeovermate = value;
                                              });
                                            },
                                            value: selectedGeovermate,
                                          ),
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText:
                                                'Enter Name of Hospital'.tr,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              this._namehospital = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Name of Hospital is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText:
                                                'Enter Hospital capacity'.tr,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              this._hospitalcapacity =
                                                  int.parse(value);
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Hospital capacity is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText:
                                                'Enter Number of busy beds'.tr,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              this._busybeds = int.parse(value);
                                            });
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Number of busy beds is required';
                                            }
                                            return null;
                                          },
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText:
                                                'Enter Number of total Intensive care '
                                                    .tr,
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Number of total Intensive care '
                                                  .tr;
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              this._carecapacity =
                                                  int.parse(value);
                                            });
                                          },
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText:
                                                'Enter Number of Intensive care available'
                                                    .tr,
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Number of intensive care available is requird ';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              this._careavailable =
                                                  int.parse(value);
                                            });
                                          },
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText: 'Enter phone number'.tr,
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Number of phone number'
                                                  .tr;
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              this._phone = int.parse(value);
                                            });
                                          },
                                        ),
                                        SizedBox(height: 10),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            labelText:
                                                'Add Link of Location'.tr,
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'That is reuired';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              this._hospitallocation = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 250),
                                ],
                              )),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Button(
                                  border: true,
                                  btnTxt: 'Save'.tr,
                                  borderColor: AppColor.pColor,
                                  onTap: () {
                                    if (formKeyhos.currentState.validate()) {
                                      formKeyhos.currentState.save();
                                      addHospital(
                                          selectedGeovermate,
                                          _namehospital,
                                          _hospitallocation,
                                          _busybeds,
                                          _hospitalcapacity,
                                          _careavailable,
                                          _carecapacity,
                                          _phone);
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

  void addHospital(
      String nameGeovermate,
      String nameHospital,
      String location,
      int busyBed,
      int capacity,
      int careAvailable,
      int totalCare,
      int phone) async {
    await hospital
        .add({
          'nameGeovermate': nameGeovermate,
          'nameHospital': nameHospital,
          'location': location,
          'busyBed': busyBed,
          'capacity': capacity,
          'careAvailable': careAvailable,
          'totalCare': totalCare,
          'phone': phone,
        })
        .then((value) => print('User added'))
        .catchError((onError) => print('error is ${onError.toString()}'));
  }
}
