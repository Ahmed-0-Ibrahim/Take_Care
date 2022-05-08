import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/views/infoHospital.dart';
import 'package:workout_app/views/login.dart';
import 'package:workout_app/widget/popularCard.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final homeKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    homeKey;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height * 0.342,
                    child: Image.asset(
                      'assets/images/h3.jpg',
                      fit: BoxFit.fitWidth,
                    )),
                SizedBox(
                  // width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: SvgPicture.asset(
                    'assets/icons/background.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: PadRadius.horizontal - 15,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: 'htxt1'.tr,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: AppColor.pColor,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: LoginState.nameText,
                                            style: TextStyle(fontSize: 25))
                                      ]),
                                    ),
                                  ],
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/icons/play.svg',
                                    ),
                                    iconSize: 70.0,
                                    onPressed: () {
                                      launch("https://youtu.be/Uqc2ATJd5iA");
                                    } //do something,
                                    ),
                                Spacer(
                                  flex: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: 'hbody1'.tr,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: AppColor.pColor,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                          text: 'hbody2'.tr,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ]),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.filter_alt_outlined),
                                        onPressed: () {
                                          launch(
                                              'https://drive.google.com/file/d/1QCun0lD-9ZAwPaD3GQ_HZ3cxA3KFuke9/view');
                                        })
                                  ],
                                ),
                                SizedBox(height: 25),
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColor.sColor,
                                      borderRadius: BorderRadius.circular(
                                          PadRadius.radius)),
                                  child: Center(
                                      child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: PadRadius.horizontal),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          child: Text(
                                            'hbody3'.tr,
                                            style: AppTextStyle.body10.copyWith(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                          onPressed: () {
//                                            InfoHospitaState.hospitals.removeRange(0,InfoHospitaState.hospitals.length);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InfoHospita()),
                                            );
                                          },
                                        ),
                                        Icon(
                                          Icons.search,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  )),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height * 0.4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: PadRadius.horizontal - 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('htitle'.tr, style: AppTextStyle.title30),
                              SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    PopularCard(
                                      asset: "h6",
                                      title: 'htitlecat1'.tr,
                                    ),
                                    PopularCard(
                                      asset: "h7",
                                      title: 'htitlecat2'.tr,
                                    ),
                                    PopularCard(
                                      asset: "h8",
                                      title: 'htitlecat3'.tr,
                                    ),
                                    PopularCard(
                                      asset: "h4",
                                      title: 'htitlecat7'.tr,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Text('htitle2'.tr, style: AppTextStyle.title30),
                              SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    PopularCard(
                                      asset: "h10",
                                      title: 'htitlecat4'.tr,
                                    ),
                                    PopularCard(
                                      asset: "H11",
                                      title: 'htitlecat6'.tr,
                                    ),
                                    PopularCard(
                                      asset: "H9",
                                      title: 'htitlecat5'.tr,
                                    ),
                                    PopularCard(
                                      asset: "555",
                                      title: 'htitlecat9'.tr,
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        launch(
                            'https://www.who.int/ar/emergencies/diseases/novel-coronavirus-2019/advice-for-public/when-and-how-to-use-masks');
                      },
                      child: Text(
                        'btnmore'.tr,
                        style: AppTextStyle.body12
                            .copyWith(color: AppColor.pColor, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
Center(
            child: Material(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                side: BorderSide(color: AppColor.pColor, width: 1),
              ),
              color: Colors.white30,
              child: Container(
                width: 350,
                height: 350,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                      'Avilable Hospitals In Egypt',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.pColor,
                        fontFamily: 'Euclid',
                        fontSize: 20,
                        shadows: [
                          Shadow(
                            blurRadius: 20.0,
                            color: AppColor.sColor,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 70,
                      width: 350,
                      child: Card(
                        child: Text('The Name of Hospital Is : '),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Card(
                            child: Text('The capacity of Hospital Is : '),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Card(
                            child: Text('The busy beds in Hospital Is : '),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Card(
                            child: Text('The are available in Hospital Is : '),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 250,
                      height: 40,
                      child: Button(
                        btnTxt: 'Go To The Location of Hospital',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
*/
