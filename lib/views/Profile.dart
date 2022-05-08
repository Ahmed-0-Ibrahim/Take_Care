import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/views/app.dart';
import 'package:workout_app/widget/about_button.dart';
import 'package:workout_app/widget/button.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Image.asset(
                    'assets/images/ui.jpg',
                  ),
                ),
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
                flex: 100,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          width: double.infinity,
                          child: ListView(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.star,
                                      size: 20,
                                      color: (index == 5)
                                          ? Colors.white54
                                          : Colors.yellow,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text('pabout'.tr, style: AppTextStyle.body20),
                              SizedBox(height: 10),
                              Text('pbody'.tr, style: AppTextStyle.body16),
                              SizedBox(height: 15),
                              TextButton(
                                onPressed: () {
                                  launch(
                                      'https://www.facebook.com/osama.anter.1238');
                                },
                                child: Text(
                                  'pname'.tr,
                                  style: AppTextStyle.body20.copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  launch(
                                      'https://www.facebook.com/profile.php?id=100002409921958');
                                },
                                child: Text(
                                  'pname2'.tr,
                                  style: AppTextStyle.body20.copyWith(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  launch(
                                      'https://www.facebook.com/adham.tawfik.9');
                                },
                                child: Text(
                                  'pname3'.tr,
                                  style: AppTextStyle.body20.copyWith(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  launch(
                                      'https://www.facebook.com/ramysophy.sophy');
                                },
                                child: Text(
                                  'pname4'.tr,
                                  style: AppTextStyle.body20.copyWith(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text('bodyhash'.tr,
                                    style: AppTextStyle.title20),
                              ),
                              SizedBox(height: 25),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AboutButton(
                                      text: 'backbtn'.tr,
                                      isColoredButton: true,
                                      onPress: () => Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Application())),
                                    ),
                                    AboutButton(
                                      isColoredButton: true,
                                      text: 'pbtn'.tr,
                                      onPress: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Application()));
                                        launch('https://youtu.be/763U4gSiKI4');
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
