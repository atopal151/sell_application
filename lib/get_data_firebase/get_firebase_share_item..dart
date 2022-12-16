// ignore_for_file: must_be_immutable, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sell_app/component/user_controller.dart';
import '../Screen/details_screen/detail_page share.dart';
import '../component/component.dart';

class FirebaseGetShareItem extends StatelessWidget {
  FirebaseGetShareItem({
    Key? key,
    required this.columnCount,
    required this.mail,
  }) : super(key: key);
  final int columnCount;
  final String mail;
  UserController uctrl = Get.put(UserController());
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 150) / 2;
    final double itemWidth = size.width / 2;
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
        .collection('ilanImage')
        .where('shareUserMail', isEqualTo: mail)
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
        return GridView.count(
          crossAxisCount: columnCount,
          childAspectRatio: (itemWidth / (itemHeight - 200)),
          scrollDirection: Axis.vertical,
          children: snapshot.data!.docs.map(
            (DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              debugPrint(data['ilanImages'].toString());
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 2,
                ),
                height: 160,
                child: InkWell(
                  onTap: () {
                    Get.to(DetailsPageShare(
                      iletisim: data["iletisim"].toString(),
                      photo_url: data['ilanImages'].toString(),
                      category: data['category'].toString(),
                      fiyat: data['fiyat'].toString(),
                      ilanBaslik: data['ilanBaslik'].toString(),
                      ilanAciklama: data['ilanAciklama'].toString(),
                      ilanTarihi: data['ilanTarihi'].toString(),
                      konum: data['konum'].toString(),
                      shareUserMail: data['shareUserMail'].toString(),
                      shareUserName: data['shareUserName'].toString(),
                      shareUserPhoto: data['shareUserPhoto'].toString(),
                      situation: data['situation'].toString(),
                      ilan_id: document.id,
                    ));
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: 1.isEven ? kPrimaryRedColor : kSecondaryColor,
                          boxShadow: const [kDefaultShadow],
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(70),
                            child: Image.network(
                              data['ilanImages'].toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 136,
                          width: size.width - 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Text(
                                  "${data['fiyat']} TL",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Text(
                                  data['ilanBaslik'].toString(),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding * 1.5,
                                  vertical: kDefaultPadding / 4,
                                ),
                                decoration: const BoxDecoration(
                                  color: kPrimaryRedColor,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(22),
                                    topRight: Radius.circular(22),
                                  ),
                                ),
                                child: Text(
                                  data['ilanTarihi'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
