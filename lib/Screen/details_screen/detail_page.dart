// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/component/component.dart';

import '../../component/user_controller.dart';
import '../message_page/component/message_detail.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({
    Key? key,
    required this.photo_url,
    required this.category,
    required this.fiyat,
    required this.ilanBaslik,
    required this.ilanTarihi,
    required this.situation,
    required this.shareUserName,
    required this.shareUserPhoto,
    required this.shareUserMail,
    required this.konum,
    required this.ilanAciklama,
    required this.ilan_id,
    required this.iletisim,
  }) : super(key: key);
  final String ilan_id;
  final String photo_url;
  final String category;
  final String fiyat;
  final String ilanBaslik;
  final String ilanAciklama;
  final String ilanTarihi;
  final String situation;
  final String shareUserName;
  final String shareUserPhoto;
  final String shareUserMail;
  final String konum;
  final String iletisim;

  final UserController ucontrol = Get.find();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Colors.white,
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              photo_url.toString(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            " $fiyat TL",
                            style: const TextStyle(
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: InkWell(
                                onTap: () {
                                  firestore
                                      .doc(
                                          "favorites/${firestore.collection("favorites").doc().id}")
                                      .set({
                                    "category": category.toString(),
                                    "situation": situation.toString(),
                                    "ilanBaslik": ilanBaslik.toString(),
                                    "ilanAciklama": ilanAciklama.toString(),
                                    "fiyat": fiyat.toString(),
                                    "iletisim": iletisim.toString(),
                                    "konum": konum.toString(),
                                    "shareUserName": shareUserName.toString(),
                                    "shareUserMail": shareUserMail.toString(),
                                    "shareUserPhoto": shareUserPhoto.toString(),
                                    "ilanImages": photo_url.toString(),
                                    "ilanTarihi": ilanTarihi.toString(),
                                    "ilanid": ilan_id.toString(),
                                    "addUserMail":
                                        ucontrol.mailAdress.toString()
                                  }, SetOptions(merge: true));
                                  Get.snackbar(
                                      "Başarılı", "Favorilere kaydedildi.",
                                      backgroundColor: whiteColor,
                                      icon: const Icon(Icons.check),
                                      colorText: Colors.black,
                                      duration: const Duration(seconds: 1));
                                },
                                child: const Icon(
                                  Icons.favorite,
                                  color: kPrimaryRedColor,
                                ))),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    locationBlock(
                        city: konum, icons: const Icon(Icons.location_on)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ilanBaslik,
                        style: const TextStyle(
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Açıklama",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        ilanAciklama,
                        style: const TextStyle(
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    const Text(
                      "Detaylar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          detailBlock(
                              detailTitle: "Kategori:", detail: category),
                          const SizedBox(
                            height: 10,
                          ),
                          detailBlock(
                              detailTitle: "Durumu:", detail: situation),
                          const SizedBox(
                            height: 10,
                          ),
                          detailBlock(
                              detailTitle: "ilan Tarihi:", detail: ilanTarihi),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "İlan Verenin",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            backgroundImage:
                                NetworkImage(shareUserPhoto.toString()),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              detailBlock(
                                  detailTitle: "Ad Soyad:",
                                  detail: shareUserName),
                              const SizedBox(
                                height: 10,
                              ),
                              detailBlock(
                                  detailTitle: "Mail:", detail: shareUserMail),
                              const SizedBox(
                                height: 10,
                              ),
                              detailBlock(
                                  detailTitle: "İletişim:", detail: iletisim),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ucontrol.mailAdress.toString() == shareUserMail.toString()
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                            color: kPrimaryRedColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.to(MessageDetails(
                                userMail: shareUserMail,
                                userName: shareUserName,
                                userPhoto: shareUserPhoto,
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.message,
                                    color: whiteColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Sohbet",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: Get.width * 0.4,
                          decoration: BoxDecoration(
                            color: kPrimaryRedColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.snackbar("İletişim Numarası", iletisim,
                                  backgroundColor: whiteColor,
                                  icon: const Icon(Icons.phone),
                                  colorText: Colors.black,
                                  duration: const Duration(seconds: 2));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Icon(
                                    Icons.phone,
                                    color: whiteColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Ara",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ]),
    );
  }

  Row locationBlock({required String city, required Icon icons}) {
    return Row(
      children: <Widget>[
        icons,
        const SizedBox(width: 10),
        Text(
          city,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row detailBlock({required String detail, required String detailTitle}) {
    return Row(
      children: <Widget>[
        Text(
          detailTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Text(
          detail,
        ),
      ],
    );
  }
}
