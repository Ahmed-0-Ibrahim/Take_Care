import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/views/signup.dart';
import 'package:workout_app/widget/aboutCard.dart';
import 'package:workout_app/widget/about_button.dart';
import 'package:workout_app/widget/bodyText.dart';
import 'package:workout_app/widget/header.dart';
import 'package:get/get.dart';
import 'adminHome.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox.expand(
            child: Image.asset(
          'assets/images/hh3.jpg',
          fit: BoxFit.fitHeight,
        )),
        Container(color: AppColor.sColor.withOpacity(0.8)),
        Column(
          children: [
            Expanded(flex: 2, child: Header()),
            Expanded(
                flex: 4,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: PadRadius.horizontal),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 9,
                          child: BodyText(bodyTxt: 'abt'.tr, desc: 'abody'.tr)),
                      SizedBox(height: 25),
                      Expanded(
                          flex: 10,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                AboutCard(
                                  txt: 'abody2'.tr,
                                  descText: 'abody2i'.tr,
                                ),
                                SizedBox(width: 20),
                                AboutCard(
                                  txt: 'abody3'.tr,
                                  descText: 'abody3i'.tr,
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AboutButton(
                                    isColoredButton: true,
                                    text: 'abody5'.tr,
                                    onPress: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp())))
                              ],
                            ),
                          ))
                    ],
                  ),
                ))
          ],
        )
      ],
    ));
  }
}
