import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/views/login.dart';
import 'package:workout_app/widget/button.dart';
import 'package:get/get.dart';

class Qrcode extends StatefulWidget {
  @override
  _QrcState createState() => _QrcState();
}

class _QrcState extends State<Qrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [body(context)],
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
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        child: _qrState(LoginState.status),
                      ),
                    ),
                    Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Row(children: [
                          SizedBox(
                            width: 80,
                          ),
                          Icon(
                            Icons.accessibility_new,
                            color: Colors.red,
                          ),
                          Text('qbody1'.tr),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          SizedBox(
                            width: 80,
                          ),
                          Icon(
                            Icons.accessibility_new,
                            color: Colors.grey,
                          ),
                          Text('qbody2'.tr)
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          SizedBox(
                            width: 80,
                          ),
                          Icon(
                            Icons.accessibility_new,
                            color: Colors.yellow,
                          ),
                          Text('qbody3'.tr)
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          SizedBox(
                            width: 80,
                          ),
                          Icon(
                            Icons.accessibility_new,
                            color: Colors.green,
                          ),
                          Text('qbody4'.tr)
                        ])
                      ],
                    ))
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Button(
                        border: false,
                        btnTxt: 'qbtn'.tr,
                        onTap: () {
                          launch(
                              'https://drive.google.com/file/d/1KB9fxhmMflq9Zgqjx2rrAWuPvUdyEE_L/view?usp=sharing');
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Card _qrState(int state) {
    if (state == 1) {
      return Card(
        child: Image.asset(
          'assets/qrcodes/2.jpeg',
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red, width: 5.0),
        ),
      );
    } else if (state == 2) {
      return Card(
        child: Image.asset(
          'assets/qrcodes/3.jpeg',
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 5.0),
        ),
      );
    } else if (state == 3) {
      return Card(
        child: Image.asset(
          'assets/qrcodes/1.jpeg',
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.yellowAccent, width: 5.0),
        ),
      );
    } else if (state == 4) {
      return Card(
        child: Image.asset(
          'assets/qrcodes/4.jpeg',
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.green, width: 5.0),
        ),
      );
    }
  }
}
