// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/component/general_app_barr.dart';

import '../../../component/component.dart';

class MessageBox extends StatelessWidget {
  MessageBox({
    Key? key,
    required this.size,
    required this.controllerMessage,
    required this.shareMail,
    required this.shareUserPhoto,
    required this.shareUserName,
  }) : super(key: key);

  final Size size;
  final String shareMail;
  final String shareUserName;
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
                    color: kSecondaryColor.withOpacity(0.5),
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
                      if (controllerMessage.text != "") {
                        firestore
                            .doc(
                                "messages/${ucontrol.mailAdress.toString()}--${shareMail.toString()}/chats/${firestore.collection("messages/${ucontrol.mailAdress.toString()}--${shareMail.toString()}/chats").doc().id}")
                            .set({
                          "message": controllerMessage.text.toString(),
                          "shareUserMail": shareMail.toString(),
                          "shareUserPhoto": shareUserPhoto.toString(),
                          "userMail": ucontrol.mailAdress.toString(),
                          "userMailPhoto": ucontrol.photo.toString(),
                          "mesajTarihi":
                              "${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} ${now.second.toString().padLeft(2, '0')}",
                        }, SetOptions(merge: true));
                        firestore
                            .doc(
                                "messages/${shareMail.toString()}--${ucontrol.mailAdress.toString()}/chats/${firestore.collection("messages/${ucontrol.mailAdress.toString()}--${shareMail.toString()}/chats").doc().id}")
                            .set({
                          "message": controllerMessage.text.toString(),
                          "shareUserMail": shareMail.toString(),
                          "shareUserPhoto": shareUserPhoto.toString(),
                          "userMail": ucontrol.mailAdress.toString(),
                          "userMailPhoto": ucontrol.photo.toString(),
                          "mesajTarihi":
                              "${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year.toString()} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} ${now.second.toString().padLeft(2, '0')}",
                        }, SetOptions(merge: true));
                        firestore
                            .doc(
                                "chats/${ucontrol.mailAdress.toString()}/user/$shareMail")
                            .set({
                          "userMail": shareMail.toString(),
                          "userName": shareUserName.toString(),
                          "userMailPhoto": shareUserPhoto.toString(),
                          "mesajTarihi":
                              "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}",
                        }, SetOptions(merge: true));
                        controllerMessage.text = "";
                      } else {
                        Get.snackbar("Uyarı", "Herhangi birşey yazmadınız!",
                            backgroundColor: whiteColor,
                            icon: const Icon(Icons.warning),
                            colorText: Colors.black,
                            duration: const Duration(seconds: 1));
                      }
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
