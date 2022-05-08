import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_app/style/styling.dart';

class HospitalCard extends StatelessWidget {
  final String txtname;
  final int care;
  final int totalCare;
  final int beds ;
  final int totalbeds;

  final int phone ;
final String location;
final String mohfza;

  const HospitalCard(
      {Key key, this.txtname, this.totalbeds , this.beds , this.totalCare,this.care, this.phone, this.location, this.mohfza})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
         margin: EdgeInsets.only(bottom:20 ),

      decoration: BoxDecoration(
        border: Border.all(color: AppColor.pColor),
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(10, 50, 50, .8),
        // color: AppColor.tColor,
      ),
      width: 400,
      height: 120,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                txtname,
                style: AppTextStyle.body20.copyWith(
                    fontSize: 25,
                    color: AppColor.pColor,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: (){
                launch('$location');
              },
            ),
            SizedBox(height: 10),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [

                    Text('Avaliable beds', style: AppTextStyle.body12.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),),
                    Text((totalbeds-beds).toString(), style: AppTextStyle.body12.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),),
                  ],
                ),

                Column(
                  children: [

                    Text('Avaliable Care', style: AppTextStyle.body12.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),),
                    Text((totalCare-care).toString(), style: AppTextStyle.body12.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),),
                  ],
                ),

                IconButton(icon: Icon(Icons.call), onPressed: (){launch('tel://$phone');})

              ],
            )

          ],
        ),
      ),
    );
  }
}
