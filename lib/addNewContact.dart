// ignore: file_names
// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:phone_book/contact.dart';
import 'package:phone_book/main.dart';
import 'package:phone_book/listViewPhone.dart';
import 'package:phone_book/textFields.dart';
import 'package:phone_book/toastMessage.dart';

class AddNewContact extends StatelessWidget {
  final ListViewPhoneState state;
  AddNewContact({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => bottomModalAdd(context),
      backgroundColor: const Color.fromARGB(255, 0, 46, 126),
      foregroundColor: Colors.white,
      hoverColor: Colors.blue,
      child: const Icon(Icons.add),
    );
  }

  void onButtonSaveClick(BuildContext context, String fullName,
      String occupation, String phone, String email) {
    if (fullName.isEmpty || phone.isEmpty) {
      showToastMessage('Please fill up name - surname and phone fields');
    } else {
      bool isValid = true;

      for (var element in ContactList.listModel) {
        if (element.fullName == fullName && element.phone == phone) {
          isValid = false;
          break;
        }
      }

      if (isValid) {
        Contact model = Contact(fullName, occupation, email, phone);
        model.imageFile = Contact.tempContact.imageFile;
        ContactList.listModel.add(model);
        Navigator.pop(context);
        showToastMessage("New contact added.");
        state.updateState();

        TextFieldNameState.nameController.clear();
        TextFieldOccupationState.occupationController.clear();
        TextFieldPhoneState.phoneController.clear();
        TextFieldEmailState.emailController.clear();
      } else {
        showToastMessage("Contact already exists.");
      }
    }
  }

  void bottomModalAdd(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //Modal Header
                ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.black,
                    onPressed: () => closeModal(context),
                  ),
                  title: const Center(
                    child: Text('New Contact',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.check),
                    color: Colors.black,
                    onPressed: () => onButtonSaveClick(
                        context,
                        TextFieldNameState.nameController.text,
                        TextFieldOccupationState.occupationController.text,
                        TextFieldPhoneState.phoneController.text,
                        TextFieldEmailState.emailController.text),
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),

                //Modal Textfields
                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.person),
                  ),
                  title: Container(
                    child: const TextFieldName(),
                  ),
                  dense: true,
                ),

                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.phone),
                  ),
                  title: Container(
                    child: const TextFieldPhone(),
                  ),
                  dense: true,
                ),

                //Modal Footer
                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      bottomModalAddMoreInfo(context);
                    },
                    child: const Text(
                      'Add more info',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ),
                  dense: true,
                ),
              ],
            ),
          );
        });
  }

  void bottomModalAddMoreInfo(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //Modal Header
                ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.black,
                    onPressed: () => closeModal(context),
                  ),
                  title: const Center(
                    child: Text('New Contact',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.check),
                    color: Colors.black,
                    onPressed: () => onButtonSaveClick(
                        context,
                        TextFieldNameState.nameController.text,
                        TextFieldOccupationState.occupationController.text,
                        TextFieldPhoneState.phoneController.text,
                        TextFieldEmailState.emailController.text),
                  ),
                ),

                const Divider(
                  thickness: 1,
                ),

                //Modal Textfields
                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.person),
                  ),
                  title: Container(
                    child: const TextFieldName(),
                  ),
                  dense: true,
                ),

                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.work),
                  ),
                  title: Container(
                    child: const TextFieldOccupation(),
                  ),
                  dense: true,
                ),

                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.phone),
                  ),
                  title: Container(
                    child: const TextFieldPhone(),
                  ),
                  dense: true,
                ),

                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.email),
                  ),
                  title: Container(
                    child: const TextFieldEmail(),
                  ),
                  dense: true,
                ),

                ListTile(
                  leading: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Icon(Icons.image),
                  ),
                  title: Container(
                    child: TextFieldImage(),
                  ),
                  dense: true,
                ),

                //Modal Footer
                ListTile(
                  leading: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      closeModalMoreInfo(context);
                      bottomModalAdd(context);
                    },
                    child: const Text(
                      'Add less info',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ),
                  dense: true,
                ),
              ],
            ),
          );
        });
  }

  void closeModal(BuildContext context) {
    TextFieldPhoneState.phoneController.clear();
    TextFieldOccupationState.occupationController.clear();
    TextFieldNameState.nameController.clear();
    TextFieldEmailState.emailController.clear();
    Navigator.pop(context);
  }

  void closeModalMoreInfo(BuildContext context) {
    TextFieldOccupationState.occupationController.clear();
    TextFieldEmailState.emailController.clear();
    Navigator.pop(context);
  }
}
