import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/widget/hospitalCard.dart';
import 'package:get/get.dart';

import 'addHospital.dart';

List<HospitalCard> hospitals = [];

class InfoHospita extends StatefulWidget {
  @override
  InfoHospitaState createState() => InfoHospitaState();
}

class InfoHospitaState extends State<InfoHospita> {

  static List<HospitalCard> hospitals = [];

  String selectedGeovermate = 'Cairo Governorate'.tr;
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          'Hospitals In Egypt :',
                          style: AppTextStyle.body20.copyWith(
                              fontSize: 25,
                              color: AppColor.pColor,
                              fontWeight: FontWeight.bold),
                        )),
                        SizedBox(
                          height: 25,
                        ),
                        DropdownButton(
                          dropdownColor: AppColor.sColor,
                          items: AddHospitalState.geovermates.map((geovermate) {
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
                        SizedBox(
                          height: 25,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
//                          shrinkWrap: true,
                            itemCount: hospitals.length,
                            itemBuilder: (context, index) {
                             if(selectedGeovermate==hospitals[index].mohfza) {
                                return hospitals[index];
                              }else
                                return SizedBox();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static Future<void> add() async {
    await FirebaseFirestore.instance
        .collection('hospital')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) async {
                hospitals.add(HospitalCard(
                    totalbeds: await doc["capacity"],
                    beds: await doc["busyBed"],
                    totalCare: await doc["totalCare"],
                    care: await doc["careAvailable"],
                    txtname: await doc["nameHospital"],
                    phone: await doc["phone"],
                    mohfza: await doc["nameGeovermate"],
                    location: await doc["location"]));
              })
            });
  }

  static void removeFromList() {
    hospitals.removeRange(0, hospitals.length);
  }


}
