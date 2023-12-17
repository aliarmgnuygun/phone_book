import 'package:flutter/material.dart';
import 'package:phone_book/addNewContact.dart';
import 'package:phone_book/contact.dart';
import 'package:phone_book/contactList_title.dart';
import 'package:phone_book/listViewPhone.dart';

void main() {
  runApp(const ContactList());
}

class ContactList extends StatelessWidget {
  static List<Contact> listModel = List<Contact>.empty(growable: true);

  const ContactList({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootLayout(),
    );
  }
}

class RootLayout extends StatelessWidget {
  final ListViewPhone listViewPhone = ListViewPhone();

  RootLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Phone Book',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 46, 126),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              // TITLE PHONE BOOK
              Container(
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TitleContactList()),
                ),
              ),

              Container(
                child: const Divider(
                  height: 0,
                  color: Colors.grey,
                ),
              ),

              // LIST PHONE BOOK
              Expanded(
                flex: 9,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: listViewPhone,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddNewContact(state: listViewPhone.state),
    );
  }
}
