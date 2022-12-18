// ignore_for_file: unused_local_variable, must_be_immutable, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sell_app/component/general_app_barr.dart';
import '../component/component.dart';

class GetMessage extends StatelessWidget {
  GetMessage({
    Key? key,
    required this.columnCount,
    required this.userMail,
  }) : super(key: key);
  final int columnCount;
  final String userMail;
  late String abc = ucontrol.mailAdress.toString() + userMail.toString();

  late String abcd = userMail.toString() + ucontrol.mailAdress.toString();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 150) / 2;
    final double itemWidth = size.width / 2;
    final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('messages').snapshots();

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
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding / 4,
                        ),
                        decoration: const BoxDecoration(
                          color: kIconTextColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(22),
                              topLeft: Radius.circular(22),
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${data['message']}  ${data["mesajTarihi"]}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      backgroundImage:
                          NetworkImage(data["userMailPhoto"].toString()),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
