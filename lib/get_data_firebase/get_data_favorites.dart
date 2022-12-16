// ignore_for_file: must_be_immutable, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../Screen/details_screen/detail_page.dart';
import '../component/component.dart';

class FirebaseGetFavoriteItem extends StatelessWidget {
  FirebaseGetFavoriteItem({
    Key? key,
    required this.columnCount,
    required this.mail,
  }) : super(key: key);

  final int columnCount;
  final String mail;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 150) / 2;
    final double itemWidth = size.width / 2;

    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
        .collection('favorites')
        .where('addUserMail', isEqualTo: mail)
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
          childAspectRatio: (itemWidth / (itemHeight)),
          scrollDirection: Axis.vertical,
          children: snapshot.data!.docs.map(
            (DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              debugPrint(data['ilanImages'].toString());
              return Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  top: 10,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.13),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.to(DetailsPage(
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(80),
                                child: Image.network(
                                  data['ilanImages'].toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${data['fiyat']} TL",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "${data['ilanBaslik']}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: greyColor,
                                size: 18,
                              ),
                              Text(
                                data['konum'].toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: kPrimaryRedColor,
                                  size: 20,
                                ),
                                onPressed: () {
                                  firestore
                                      .doc(
                                          "favorites/${firestore.collection("favorites").doc(document.id).id}")
                                      .delete();
                                  Get.snackbar(
                                      "Başarılı", "İlanın başarı ile silindi.",
                                      backgroundColor: whiteColor,
                                      icon: const Icon(Icons.delete),
                                      colorText: Colors.black,
                                      duration: const Duration(seconds: 2));
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
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
