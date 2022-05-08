import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/infoCard.dart';
import 'package:get/get.dart';

import 'app.dart';

class Info extends StatefulWidget {
  @override
  InfoState createState() => InfoState();
}

class InfoState extends State<Info> {
  @override
  void initState() {
    super.initState();
  }

  int totalcases = 168057, totaldeaths = 9512, totalrecovers = 130429;

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
                  height: MediaQuery.of(context).size.height * 0.78,
                  child: Image.asset(
                    'assets/images/hh3.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                body(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox body(BuildContext context) {
    DateTime now;
    setState(() {
      now = DateTime.now();
    });

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PadRadius.horizontal - 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'stat'.tr + '( ${now.day} \\ ${now.month} \\ ${now.year} )',
                    style: new TextStyle(
                      color: AppColor.sColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            blurRadius: 5.0,
                            color: AppColor.pColor,
                            offset: Offset(5.0, 5.0))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 2,
                  child: ListView(
                    children: [
                      SizedBox(height: 25),
                      InfoCard(
                        txt: 'ibody1'.tr,
                        descText: '${ApplicationState.cases}',
                      ),
                      InfoCard(
                        txt: 'ibody2'.tr,
                        descText:
                            '${totalcases + int.parse(ApplicationState.cases)}',
                      ),
                      InfoCard(
                        txt: 'ibody3'.tr,
                        descText: '${ApplicationState.deaths}',
                      ),
                      InfoCard(
                        txt: 'ibody4'.tr,
                        descText:
                            '${totaldeaths + int.parse(ApplicationState.deaths)}',
                      ),
                      InfoCard(
                        txt: 'ibody5'.tr,
                        descText: '${ApplicationState.recovers}',
                      ),
                      InfoCard(
                        txt: 'ibody6'.tr,
                        descText:
                            '${totalrecovers + int.parse(ApplicationState.recovers)}',
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Button(
                          border: false,
                          btnTxt: 'ibtn'.tr,
                          onTap: () => launch(
                              'https://news.google.com/covid19/map?hl=ar&mid=%2Fm%2F02k54&gl=EG&ceid=EG%3Aar'),
                        ),
                      ],
                    ))
              ]),
        ),
      ),
    );
  }

  static Future<String> getInjuries() async {
    String sta;
    await FirebaseFirestore.instance
        .collection('statistics')
        .where('id', isEqualTo: 3)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) async {
                sta = doc["injuries"].toString();
                print(sta);
              })
            });
    return sta;
  }

  static Future<String> getRecovers() async {
    String sta;
    await FirebaseFirestore.instance
        .collection('statistics')
        .where('id', isEqualTo: 2)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) async {
                sta = doc["recovers"].toString();
                print(sta);
              })
            });
    return sta;
  }

  static Future<String> getDeaths() async {
    String sta;
    await FirebaseFirestore.instance
        .collection('statistics')
        .where('id', isEqualTo: 1)
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) async {
                sta = doc["deaths"].toString();
                print(sta);
              })
            });
    return sta;
  }
}
