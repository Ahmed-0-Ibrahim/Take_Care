import 'package:flutter/material.dart';
import 'package:workout_app/database/database.dart';

import 'package:get/get.dart';

class Forms {
  static final formKey = GlobalKey<FormState>();
  static final formKeyLogin = GlobalKey<FormState>();
  Database reigester = Database();

  static String vEmail = '', vName = '', vPhone = '', vid = '', vPassword = '';

  Form formLogin() {
    return Form(
      key: formKeyLogin,
      child: Column(
        children: [
          textField(labelText: 'lbody1'.tr),
          SizedBox(height: 10),
          textField(labelText: 'lbody2'.tr, obscure: true),
        ],
      ),
    );
  }

  static TextFormField textField(
      {String labelText, bool obscure = false, String passing}) {
    return TextFormField(
      onSaved: (value) async {
        passing = value;
      },
      validator: (value) {
        if (obscure) {
          if (value.length == 0)
            return "Please Enter Your $labelText ";
          else if (value.length < 6)
            return "Password too short, Enter Strong Password";
          else
            null;
        }

        if (value.isEmpty) {
          return "Please Enter Your $labelText ";
        } else {
          return null;
        }
      },
      obscureText: obscure,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
