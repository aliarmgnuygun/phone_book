// ignore_for_file: unnecessary_new

import 'dart:io';

class Contact {
  String fullName;
  String occupation;
  String email;
  String phone;
  File? imageFile;

  static Contact tempContact = new Contact("", "", "", "");

  Contact(this.fullName, this.occupation, this.email, this.phone,
      {this.imageFile});
}
