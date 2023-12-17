// ignore_for_file: unused_import, unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:phone_book/main.dart';
import 'package:phone_book/toastMessage.dart';

void deleteModal(BuildContext context, int i) {
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
              Container(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                        "Delete '" + ContactList.listModel[i].fullName + "'?"),
                  ),
                ),
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
                                deleteData(i);
                                showToastMessage('Contact Deleted.');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContactList()),
                                );
                              },
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(fontSize: 15),
                              ),
                              child: const Text(
                                'Delete',
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
              )
            ],
          ),
        );
      });
}

void deleteData(int i) {
  ContactList.listModel.removeAt(i);
}
