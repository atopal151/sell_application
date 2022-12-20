// ignore_for_file: unused_local_variable, must_be_immutable, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sell_app/component/general_app_barr.dart';
import '../Screen/message_page/component/message_detail.dart';
import '../component/component.dart';

class GetMessageList extends StatelessWidget {
  const GetMessageList({
    Key? key,
    required this.userMail,
  }) : super(key: key);
  final String userMail;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 150) / 2;
    final double itemWidth = size.width / 2;
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
        .collection('chats/${ucontrol.mailAdress.toString()}/user')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Tooltip(message: 'Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SpinKitRing(
            color: kPrimaryRedColor,
            size: 50.0,
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
              children: snapshot.data!.docs.map(
            (DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(MessageDetails(
                          userMail: data['userMail'],
                          userName: data['userName'],
                          userPhoto: data["userMailPhoto"],
                        ));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            backgroundImage:
                                NetworkImage(data["userMailPhoto"].toString()),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data['userName']} ",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Son Konuşma Saati: (${data['mesajTarihi']})",
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList()),
        );
      },
    );
  }
}
