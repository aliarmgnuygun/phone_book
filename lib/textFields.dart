// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_book/contact.dart';

class TextFieldName extends StatefulWidget {
  const TextFieldName({super.key});

  @override
  TextFieldNameState createState() => TextFieldNameState();
}

class TextFieldNameState extends State<TextFieldName> {
  static TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      onChanged: (value) {
        setState(() {});
      },
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: 'Name - Surname',
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        contentPadding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        suffixIcon: nameController.text.isNotEmpty
            ? null
            : IconButton(
                iconSize: 15,
                color: Colors.red,
                onPressed: nameController.clear,
                icon: const Icon(Icons.clear),
              ),
        errorText: validateInput(nameController.text),
      ),
    );
  }
}

//Textfield Occupation
class TextFieldOccupation extends StatefulWidget {
  const TextFieldOccupation({super.key});

  @override
  TextFieldOccupationState createState() => TextFieldOccupationState();
}

class TextFieldOccupationState extends State<TextFieldOccupation> {
  static TextEditingController occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: occupationController,
      onChanged: (value) {
        setState(() {});
      },
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        hintText: "Occupation",
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        contentPadding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        suffixIcon: occupationController.text.isEmpty
            ? null
            : IconButton(
                iconSize: 15,
                color: Colors.red,
                onPressed: occupationController.clear,
                icon: const Icon(Icons.clear),
              ),
      ),
    );
  }
}

class TextFieldPhone extends StatefulWidget {
  const TextFieldPhone({super.key});

  @override
  TextFieldPhoneState createState() => TextFieldPhoneState();
}

class TextFieldPhoneState extends State<TextFieldPhone> {
  static TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Phone Number",
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        contentPadding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        suffixIcon: phoneController.text.isEmpty
            ? null
            : IconButton(
                iconSize: 15,
                color: Colors.red,
                onPressed: phoneController.clear,
                icon: const Icon(Icons.clear),
              ),
        errorText: validateInput(phoneController.text),
      ),
    );
  }
}

class TextFieldEmail extends StatefulWidget {
  const TextFieldEmail({super.key});

  @override
  TextFieldEmailState createState() => TextFieldEmailState();
}

class TextFieldEmailState extends State<TextFieldEmail> {
  static TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      onChanged: (value) {
        setState(() {});
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "sample@gmail.com",
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
        contentPadding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        suffixIcon: emailController.text.isEmpty
            ? null
            : IconButton(
                iconSize: 15,
                color: Colors.red,
                onPressed: emailController.clear,
                icon: const Icon(Icons.clear),
              ),
      ),
    );
  }
}

String? validateInput(String value) {
  if (value.isEmpty) {
    return "This field is required.";
  }
  return null;
}
