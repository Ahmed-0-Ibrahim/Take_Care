import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';

import 'package:workout_app/views/addPerson.dart';
import 'package:workout_app/views/addHospital.dart';
import 'package:workout_app/widget/bodyText.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/header.dart';
import 'package:get/get.dart';

import 'addInjuries.dart';
import 'addHospital.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(),
          Container(color: AppColor.sColor.withOpacity(0.8)),
          body(context)
        ],
      ),
    );
  }

  body(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Header()),
        Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: PadRadius.horizontal),
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: BodyText(bodyTxt: 'wlcm'.tr, desc: 'wbody'.tr)),
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Button(
                            btnTxt: 'ahbutton1'.tr,
                            border: false,
                            roundedBorder: true,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddInjuries()));
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Button(
                            btnTxt: 'ahbutton2'.tr,
                            border: true,
                            roundedBorder: true,
                            borderColor: Colors.white,
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPerson())),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Button(
                            btnTxt: 'addHospital'.tr,
                            border: false,
                            roundedBorder: true,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddHospital()),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ))
      ],
    );
  }

  SizedBox backgroundImage() {
    return SizedBox.expand(
        child: Image.asset(
      'assets/images/hh.png',
      fit: BoxFit.fitHeight,
    ));
  }
}
