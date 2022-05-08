import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/hotlineCard.dart';
import 'package:get/get.dart';

class Hotline extends StatelessWidget {
  int phone = 115;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/hh.png',
                  height: 550,
                ),
                Container(color: AppColor.sColor.withOpacity(0.7)),
                body(context)
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
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'hottitle'.tr,
                            style: AppTextStyle.title27,
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HotlineCard(
                          txt: 'hotbody1'.tr,
                          descText: 'hotbodynum1'.tr,
                        ),
                          SizedBox(height: 10),
                          HotlineCard(
                            txt: 'hotbody2'.tr,
                            descText: 'hotbodynum2'.tr,
                          ),
                          SizedBox(height: 10),
                          HotlineCard(
                            txt: 'hotbody3'.tr,
                            descText: 'hotbodynum3'.tr,
                          ),
                          SizedBox(height: 10),
                          HotlineCard(
                            txt: 'hotbody4'.tr,
                            descText: 'hotbodynum4'.tr,
                          ),
                          SizedBox(height: 10),
                          HotlineCard(
                            txt: 'hotbody5'.tr,
                            descText: 'hotbodynum5'.tr,
                          ),
                          SizedBox(height: 10),
                          HotlineCard(
                            txt: 'hotbody6'.tr,
                            descText: 'hotbodynum6'.tr,
                          ),
                          SizedBox(height: 10),
                          HotlineCard(
                            txt: 'hotbody7'.tr,
                            descText: 'hotbodynum7'.tr,
                          ),
                          SizedBox(height: 10),
                          HotlineCard(
                            txt: 'hotbody8'.tr,
                            descText: 'hotbodynum8'.tr,
                          ),
                          SizedBox(height: 10),
                          HotlineCard(
                            txt: 'hotbody9'.tr,
                            descText: 'hotbodynum9'.tr,
                          ),
                          SizedBox(height: 30),
                          Button(
                            border: false,
                            btnTxt: 'hotbtn'.tr,
                            onTap: () {
                              launch('tel://105');
                            },
                          ),
                          SizedBox(height: 30),
                          Button(
                            border: false,
                            btnTxt: 'hotbtn2'.tr,
                            onTap: () {
                              launch('tel://15335');
                            },
                          ),
                          SizedBox(height: 200),

                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
