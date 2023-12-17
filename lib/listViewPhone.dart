// ignore: file_names
// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:phone_book/contact.dart';
import 'package:phone_book/contactDetails.dart';
import 'package:phone_book/main.dart';
import 'package:phone_book/toastMessage.dart';

class ListViewPhone extends StatefulWidget {
  final ListViewPhoneState state = ListViewPhoneState();

  ListViewPhone({super.key});
  @override
  ListViewPhoneState createState() => state;
}

class ListViewPhoneState extends State<ListViewPhone> {
  updateState() {
    if (mounted) {
      print('Mounted');
      setState(() {});
    } else {
      print('Not Mounted');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ContactList.listModel.isEmpty) {
      return const NoData();
    }
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: ContactList.listModel.length,
      itemBuilder: (context, i) {
        Contact contact = ContactList.listModel[i];
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          actions: [
            IconSlideAction(
              caption: 'Share',
              color: const Color.fromARGB(255, 47, 143, 50),
              icon: Icons.share,
              onTap: () => showToastMessage("Person information copied"),
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {
                deleteData(i);
                updateState();
                showToastMessage("Contact deleted.");
              },
            ),
          ],
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetails(i),
                ),
              );
            },
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            title: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor:
                      Color((contact.fullName.hashCode * 0xFFFFFF).toInt())
                          .withOpacity(1.0),
                  child: Text(
                    getInitials(contact.fullName),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  ContactList.listModel[i].fullName,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void deleteData(int i) {
    ContactList.listModel.removeAt(i);
  }

  String getInitials(String name) {
    List<String> names = name.split(' ');
    String initials = "";

    for (var i = 0; i < names.length; i++) {
      if (names[i].isNotEmpty) {
        initials += '${names[i][0].toUpperCase()}';
      }
      if (initials.length == 2) {
        break;
      }
    }
    return initials;
  }
}

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("There is no contact yet."),
    );
  }
}
