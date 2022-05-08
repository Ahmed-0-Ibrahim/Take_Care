import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:workout_app/data/Citizens.dart';
import 'package:workout_app/views/login.dart' as login;

class ApplicationList   {

 // ignore: deprecated_member_use
 //static var data = new List<Citizens> (100);
 static Citizens data =new Citizens("osama", "osamaanterpopsoma12345@gmail.com", '123', 01116741831, 10104477852369);
// ApplicationList(){
//   data[0]=new Citizens("osama", "osamaanterpopsoma12345@gmail.com", '123', 01116741831, 10104477852369);
// }
//
// static bool searchLogIn(){
//   bool testLogin = false;
//   for(int i=0 ; i<data.length ;i++){
//     if((login.Login.loginname.toString() == data[i].name)&&(login.Login.loginpassword.toString() == data[i].password)){
//       //print('l;dmg');
//       testLogin = true;
//       //break;
//       return testLogin;
//     }
//   }
//   // if(!testLogin) {
//   //   print('fffffffffffffffffffffffffffffffffffffffff');
//   //   return testLogin;
//   // }
//   return testLogin;
// }


}