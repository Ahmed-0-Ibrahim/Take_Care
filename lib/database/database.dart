import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_app/style/styling.dart';

class Database extends StatelessWidget {
  FirebaseAuth inst = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Future<void> showMyDialog(String textalert) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Attention!!'),
            backgroundColor: AppColor.sColor,
            actions: <Widget>[
              TextButton(
                child: Text('$textalert'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  signUp(String email, String password, String name, String id,
      String phone) async {
    try {
      UserCredential user = await inst.createUserWithEmailAndPassword(
          email: email, password: password);
      addUSer(email, password, name, id, phone);
    } catch (e) {
      print(e.toString());
      // if (e.code == 'email-already-in-use') {
      //   // showMyDialog(e.toString());
      //   print(e.toString());
      // } else if (e.code == 'invalid-email') {
      //   // showMyDialog(e.toString());
      //   print(e.toString());
      // } else if (e.code == 'weak-password') {
      //   // showMyDialog(e.toString());
      //   print(e.toString());
      // } else {
      //   // showMyDialog('Wrong in data !!!!!');
      //   print(e.toString());
      // }
    }
  }

  signIn(email, password) async {
    try {
      // FirebaseAuth fireAuth = await FirebaseAuth.instance;
      User result = (await inst.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      print(result.email);
    } catch (e) {
      if (e.code == 'invalid-email') {
        // showMyDialog(e.toString());
        print(e.toString());
      } else if (e.code == 'user-disabled') {
        print(e.toString());
        // showMyDialog(e.toString());
      } else if (e.code == 'user-not-found') {
        print(e.toString());
        // showMyDialog(e.toString());
      } else if (e.code == 'wrong-password') {
        print(e.toString());
        // showMyDialog(e.toString());
      } else {
        print(e.toString());
        // showMyDialog('Wrong in data');
      }
    }
  }

  void addUSer(String email, String password, String name, String id,
      String phone) async {
    await users
        .add({
          'email': email,
          'password': password,
          'name': name,
          'id': id,
          'phone': phone,
          'status': 1,
        })
        .then((value) => print('User added'))
        .catchError((onError) => print('error is ${onError.toString()}'));
  }
}
