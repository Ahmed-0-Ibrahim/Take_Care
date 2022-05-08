import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';

class HotlineCard extends StatelessWidget {
  final String txt;
  final String descText;
  const HotlineCard(
      {Key key, @required this.descText , @required this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
   //   margin: EdgeInsets.only(left:120 ,bottom:5 ),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(10, 50, 50, .8),
          // color: AppColor.tColor,
      ),
      width: 400,
      height: 80,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              txt,
              style: AppTextStyle.body20.copyWith(
                  fontSize: 25,
                  color: AppColor.pColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(descText, style: AppTextStyle.body12.copyWith(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
