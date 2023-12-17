// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_const_constructors, unnecessary_string_interpolations, unnecessary_const

import 'package:flutter/material.dart';
import 'package:phone_book/deleteContact.dart';
import 'package:phone_book/listViewPhone.dart';
import 'package:phone_book/main.dart';
import 'package:phone_book/toastMessage.dart';
import 'package:phone_book/updateContact.dart';

class ContactDetails extends StatelessWidget {
  final ListViewPhoneState state = ListViewPhoneState();

  late String contact_fullName;
  late String contact_occupation;
  late String contact_phone;
  late String contact_email;

  var counter = 0;
  late int position;

  ContactDetails(this.position, {super.key});

  @override
  Widget build(BuildContext context) {
    for (var element in ContactList.listModel) {
      if (counter == position) {
        contact_fullName = element.fullName;
        contact_occupation = element.occupation;
        contact_phone = element.phone;
        contact_email = element.email;
        break;
      }
      counter++;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Contact Details',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactList()),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTapDown: (TapDownDetails details) {
                    showPopupMenu(context, details.globalPosition, position);
                  },
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
          backgroundColor: const Color.fromARGB(255, 0, 46, 126),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor:
                      Color((contact_fullName.hashCode * 0xFFFFFF).toInt())
                          .withOpacity(1.0),
                  radius: 40,
                  child: Text(getInitials(contact_fullName),
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                  width: 200,
                ),
                Text(
                  contact_fullName,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                Text(
                  contact_occupation,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                  width: 200,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: MaterialButton(
                                        onPressed: () => showToastMessage(
                                            'Call is unavailable at this moment.'),
                                        color: Colors.white70,
                                        textColor: Colors.black,
                                        child: Icon(
                                          Icons.call_outlined,
                                          size: 24,
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        shape: const CircleBorder(),
                                      ),
                                    ),
                                    const Text('Call')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: MaterialButton(
                                        onPressed: () => showToastMessage(
                                            'Message is unavailable at this moment.'),
                                        color: Colors.white70,
                                        textColor: Colors.black,
                                        child: Icon(
                                          Icons.message_outlined,
                                          size: 24,
                                        ),
                                        padding: EdgeInsets.all(16),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                    Text('Message')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: MaterialButton(
                                        onPressed: () => showToastMessage(
                                            'Video is unavailable at this moment.'),
                                        color: Colors.white70,
                                        textColor: Colors.black,
                                        child: Icon(
                                          Icons.video_call_outlined,
                                          size: 24,
                                        ),
                                        padding: EdgeInsets.all(16),
                                        shape: CircleBorder(),
                                      ),
                                    ),
                                    Text('Video')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      title: Text(
                        contact_phone,
                      ),
                    )),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    title: Text(
                      contact_email,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void showPopupMenu(BuildContext context, Offset offset, int i) async {
    final ListViewPhone listViewPhone = ListViewPhone();

    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        const PopupMenuItem<String>(
            value: '1',
            child: Text(
              'Edit',
              style: TextStyle(fontSize: 15),
            )),
        const PopupMenuItem<String>(
            value: '2',
            child: const Text(
              'Delete',
              style: TextStyle(fontSize: 15),
            )),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == "1") {
        updateModal(context, i);
      } else if (value == "2") {
        deleteModal(context, i);
      }
    });
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
