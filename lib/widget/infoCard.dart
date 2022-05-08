import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';

class InfoCard extends StatelessWidget {
  final String txt;
  final String descText;
  const InfoCard(
      {Key key, @required this.descText , @required this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:120 ,bottom:15 ),

      decoration: BoxDecoration(
          color: Color.fromRGBO(10, 50, 50, .7),
          // color: AppColor.tColor,
          borderRadius: BorderRadius.circular(15)
      ),
      width: 500,
      height: 80,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
               Text(
                txt,
                style: AppTextStyle.body20.copyWith(
                    fontSize: 15,
                    color: AppColor.pColor,
                    fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 15),
            Text(descText, style: AppTextStyle.body12.copyWith(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
