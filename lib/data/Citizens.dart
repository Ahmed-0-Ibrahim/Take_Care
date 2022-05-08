import 'dart:core';

class Citizens {
  String name, email, password;
  int mobile, ssn, statue;

  Citizens(this.name, this.email, this.password, this.mobile, this.ssn );

  Citizens.st(this.statue);

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getModel() {
    return email;
  }

  void setEmail(String email) {
    this.email = email;
  }

  String getPassword() {
    return password;
  }

  void setPassword(String password) {
    this.password = password;
  }

  int getSsn() {
    return ssn;
  }

  void setSsn(int ssn) {
    this.ssn = ssn;
  }

  int getMobile() {
    return mobile;
  }

  void setMobile(int mobile) {
    this.mobile = mobile;
  }

  int getStatue() {
    return statue;
  }

  void setStatue(int statue) {
    this.statue = statue;
  }
}
