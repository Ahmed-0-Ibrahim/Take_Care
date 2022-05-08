import 'package:flutter/material.dart';
import 'package:workout_app/style/styling.dart';

class PopularCard extends StatelessWidget {
  final String asset;
  final String title;
  final String Shape ;
  const PopularCard({Key key, this.asset, this.title , this.Shape}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0, bottom: 10.0),
            child: Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      color: AppColor.tColor,
                      width: 2,style: BorderStyle.solid)),
              child: Image.asset('assets/images/$asset.jpg', fit: BoxFit.fill,),

            )
        ),
        //SizedBox(height: 10),
        Text(
          title,
          style: AppTextStyle.body12,
        )

      ],
    );
  }
}
