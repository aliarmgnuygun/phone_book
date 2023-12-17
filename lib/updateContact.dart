// ignore_for_file: unused_import, unnecessary_new, prefer_const_constructors, file_names, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:phone_book/contact.dart';
import 'package:phone_book/contactDetails.dart';
import 'package:phone_book/main.dart';
import 'package:phone_book/textFields.dart';
import 'package:phone_book/toastMessage.dart';

void updateModal(BuildContext context, int i) {
  TextEditingController updateName_Controller =
      TextEditingController(text: ContactList.listModel[i].fullName);
  TextEditingController updateOccupation_Controller =
      TextEditingController(text: ContactList.listModel[i].occupation);
  TextEditingController updatePhone_Controller =
      TextEditingController(text: ContactList.listModel[i].phone);
  TextEditingController updateEmail_Controller =
      TextEditingController(text: ContactList.listModel[i].email);

  TextFieldNameState.nameController.text = updateName_Controller.text;
  TextFieldOccupationState.occupationController.text =
      updateOccupation_Controller.text;
  TextFieldPhoneState.phoneController.text = updatePhone_Controller.text;
  TextFieldEmailState.emailController.text = updateEmail_Controller.text;

  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
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
                title: Center(
                  child: Text('Update Contact',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),

              Divider(
                thickness: 1,
              ),

              //Modal Textfields
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(Icons.person),
                ),
                title: Container(
                  child: TextFieldName(),
                ),
                dense: true,
              ),

              ListTile(
                leading: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(Icons.work),
                ),
                title: Container(
                  child: TextFieldOccupation(),
                ),
                dense: true,
              ),

              ListTile(
                leading: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(Icons.phone),
                ),
                title: Container(
                  child: TextFieldPhone(),
                ),
                dense: true,
              ),

              ListTile(
                leading: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Icon(Icons.email),
                ),
                title: Container(
                  child: TextFieldEmail(),
                ),
                dense: true,
              ),

              SizedBox(
                height: 10.0,
              ),

              Container(
                child: Center(
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                onButtonUpdate(
                                    context,
                                    i,
                                    TextFieldNameState.nameController.text,
                                    TextFieldOccupationState
                                        .occupationController.text,
                                    TextFieldPhoneState.phoneController.text,
                                    TextFieldEmailState.emailController.text);
                              },
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                              ),
                              child: const Text(
                                'Update',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

void onButtonUpdate(
  BuildContext context,
  int i,
  String update_name,
  String update_occupation,
  String update_phone,
  String update_email,
) {
  if (update_name == "" || update_phone == "") {
    showToastMessage('Please fill up name and phone fields.');
  } else {
    bool isValid = true;

    for (var element in ContactList.listModel) {
      if (element.fullName == update_name &&
          element.occupation == update_occupation &&
          element.phone == update_phone &&
          element.email == update_email) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      Contact update_model =
          Contact(update_name, update_occupation, update_email, update_phone);

      for (var element in ContactList.listModel) {
        if (element == ContactList.listModel[i]) {
          ContactList.listModel.removeAt(i);
          ContactList.listModel.insert(i, update_model);
        }
      }

      // state.updateState();
      showToastMessage('Contact updated.');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ContactDetails(i)),
          (Route<dynamic> route) => route.isFirst);

      TextFieldNameState.nameController.clear();
      TextFieldOccupationState.occupationController.clear();
      TextFieldPhoneState.phoneController.clear();
      TextFieldEmailState.emailController.clear();
    } else {
      showToastMessage('Contact already exists.');
    }
  }
}
