import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/views/app.dart';
import 'package:workout_app/widget/bodyText.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/header.dart';
import 'about.dart';
import 'package:get/get.dart';

import 'infoHospital.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  FirebaseAuth insta = FirebaseAuth.instance;
  String _selectedLang = 'en';

  _WelcomeState(){
    InfoHospitaState.hospitals.removeRange(0,InfoHospitaState.hospitals.length);
//    InfoHospitaState.removeFromList();
  print("Removrd");
  }

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
                      flex: 3,
                      child: Column(
                        children: [
                          Button(
                            btnTxt: 'wbutton'.tr,
                            border: false,
                            roundedBorder: true,
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => About())),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Button(
                            btnTxt: 'wbutton2'.tr,
                            border: true,
                            roundedBorder: true,
                            borderColor: Colors.white,
                            onTap: () {
                              if(InfoHospitaState.hospitals.length==0) {
                                  InfoHospitaState.add();
                                }
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Application()));
                            }
                          )
                        ],
                      )),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text('English'),
                            value: 'en',
                          ),
                          DropdownMenuItem(
                            child: Text('العربية'),
                            value: 'ar',
                          ),
                        ],
                        value: _selectedLang,
                        onChanged: (value) {
                          setState(() {
                            _selectedLang = value;
                          });
                          Get.updateLocale(Locale(_selectedLang));
                        },
                      ),
                    ),
                  )
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
