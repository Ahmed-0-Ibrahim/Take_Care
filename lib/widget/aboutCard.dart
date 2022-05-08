import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';

class AboutCard extends StatelessWidget {
  final String txt;
  final String descText;
  const AboutCard(
      {Key key, @required this.descText, @required this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.tColor, borderRadius: BorderRadius.circular(15)),
      width: 195,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PadRadius.horizontal - 15,
            vertical: PadRadius.vertical),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              txt,
              style: AppTextStyle.body20.copyWith(
                  fontSize: 30,
                  color: AppColor.pColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(descText, style: AppTextStyle.body12)
          ],
        ),
      ),
    );
  }
}
