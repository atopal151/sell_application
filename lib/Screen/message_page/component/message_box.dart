// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sell_app/component/general_app_barr.dart';

import '../../../component/component.dart';

class MessageBox extends StatelessWidget {
  MessageBox({
    Key? key,
    required this.size,
    required this.controllerMessage,
    required this.shareMail,
    required this.shareUserPhoto,
  }) : super(key: key);

  final Size size;
  final String shareMail;
  final String shareUserPhoto;
  final TextEditingController controllerMessage;

  DateTime now = DateTime.now();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kSecondaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      cursorColor: kPrimaryRedColor,
                      controller: controllerMessage,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        icon: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          backgroundImage:
                              NetworkImage(ucontrol.photo.toString()),
                        ),
                        hintText: "Buraya yazın...",
                        hintStyle: const TextStyle(
                          color: kSecondaryColor,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.send,
                      color: kIconTextColor,
                    ),
                    onTap: () {
                      firestore
                          .doc(
                              "messages/${firestore.collection("messages").doc().id}")
                          .set({
                        "message": controllerMessage.text.toString(),
                        "shareUserMail": shareMail.toString(),
                        "shareUserPhoto": shareUserPhoto.toString(),
                        "userMail": ucontrol.mailAdress.toString(),
                        "kisiler": ucontrol.mailAdress.toString() +
                            shareMail.toString(),
                        "userMailPhoto": ucontrol.photo.toString(),
                        "mesajTarihi":
                            "${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} ${now.second.toString().padLeft(2, '0')}",
                      }, SetOptions(merge: true));
                      controllerMessage.text = "";
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
