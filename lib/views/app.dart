import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/views/Profile.dart';
import 'package:workout_app/views/checkUp.dart';
import 'package:workout_app/views/home.dart';
import 'package:workout_app/views/hotline.dart';
import 'package:workout_app/views/login.dart';
import 'package:workout_app/views/qrcode.dart';
import 'package:workout_app/views/welcome.dart';
import 'package:get/get.dart';

import 'info.dart';

class Application extends StatefulWidget {
  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  PageController _myPage = PageController(initialPage: 0);
  int selected = 0;
  FirebaseAuth insta = FirebaseAuth.instance;
  static String cases = '', deaths = '', recovers = '', emailUser;

  @override
  void initState() {
    super.initState();
    _myPage = PageController();
    insta.authStateChanges().listen((User user) async {
      if (user == null) {
        print('no users');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login(),
        ));
      } else {
        LoginState.nameText = await LoginState.returnName(user.email);
        LoginState.status = await LoginState.returnStatus(user.email);
        emailUser = user.email;
      }

      cases = await InfoState.getInjuries();
      deaths = await InfoState.getDeaths();
      recovers = await InfoState.getRecovers();
    });
  }

  @override
  void dispose() {
    _myPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          child: Text(
            'wheader'.tr + 'wheader2'.tr,
            textDirection: TextDirection.ltr,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.pColor,
                fontFamily: 'Euclid',
                fontSize: 20.0),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Application()));
          },
        ),
        leading: new Container(
          child: IconButton(
              icon: Image.asset(
                'assets/images/co1.png',
              ),
              onPressed: () {
                launch(
                    'https://www.care.gov.eg/EgyptCare/StaticContent/About.aspx');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Application()));
              } //do something,
              ),
        ),
        backgroundColor: AppColor.sColor,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.accessibility),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => CheckUp())),
          ),
          new IconButton(
            icon: new Icon(Icons.info_outline),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Profile())),
          ),
          new IconButton(
            icon: new Icon(Icons.logout),
            onPressed: () {
              _showMyDialog();
            },
          ),
        ],
      ),
      body: PageView(
        controller: _myPage,
        onPageChanged: (index) {
          setState(() => selected = index);
        },
        children: [
          Home(),
          Info(),
          Qrcode(),
          Hotline(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColor.sColor,
        child: _buildBottomBar(),
      ),
    );
  }

  Padding _buildBottomBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PadRadius.horizontal - 10),
      child: Container(
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bottomBarIcon(asset: 'menu', index: 0),
            bottomBarItems(index: 1, title: 'static'.tr),
            bottomBarItems(index: 2, title: 'code'.tr),
            bottomBarItems(index: 3, title: 'hot'.tr),
          ],
        ),
      ),
    );
  }

  GestureDetector bottomBarIcon({String asset, int index}) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _myPage.jumpToPage(index);
          });
        },
        child: SvgPicture.asset('assets/icons/$asset.svg',
            height: 25,
            width: 25,
            color: selected == index ? AppColor.pColor : Colors.grey));
  }

  GestureDetector bottomBarItems({int index, String title}) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _myPage.jumpToPage(index);
          });
        },
        child: Container(
            height: 50,
            width: 80,
            color: AppColor.sColor,
            child: Center(
                child: Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: selected == index ? AppColor.pColor : Colors.grey),
            ))));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('alertlogout'.tr),
          backgroundColor: AppColor.sColor,
          actions: <Widget>[
            TextButton(
              child: Text('alertno'.tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('alertyes'.tr),
              onPressed: () {
                Navigator.of(context).pop();
                insta.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
            ),
          ],
        );
      },
    );
  }
}
