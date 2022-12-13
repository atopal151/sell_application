// ignore_for_file: non_constant_identifier_names, file_names, avoid_print

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import '../../component/component.dart';
import '../../component/title_custon_underline.dart';
import '../../component/user_controller.dart';
import '../sales_page/component/dropdown_category.dart';
import '../sales_page/component/dropdown_country.dart';
import '../sales_page/component/dropdown_situation.dart';
import '../sales_page/component/text_field.dart';

class DetailsPageShare extends StatefulWidget {
  const DetailsPageShare(
      {Key? key,
      required this.ilan_id,
      required this.photo_url,
      required this.category,
      required this.fiyat,
      required this.ilanBaslik,
      required this.ilanAciklama,
      required this.ilanTarihi,
      required this.situation,
      required this.shareUserName,
      required this.shareUserPhoto,
      required this.shareUserMail,
      required this.konum,
      required this.iletisim})
      : super(key: key);
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

  @override
  State<DetailsPageShare> createState() => _DetailsPageShareState();
}

class _DetailsPageShareState extends State<DetailsPageShare> {
  final UserController ucontrol = Get.find();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var count = 0.obs;
  DropDownCategoty dropDownCategory = DropDownCategoty();
  DropDownSituation dropDownSituation = DropDownSituation();
  DropDownCountry dropDownCountry = DropDownCountry();

  late TextEditingController controllerBaslik;
  late TextEditingController controllerAcikla;
  late TextEditingController controllerFiyat;
  late TextEditingController controllerKonum;
  late TextEditingController controllerIletisim;

  @override
  void initState() {
    super.initState();
    controllerBaslik = TextEditingController();
    controllerAcikla = TextEditingController();
    controllerFiyat = TextEditingController();
    controllerKonum = TextEditingController();
    controllerIletisim = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var selectedcategoryVal = widget.category.obs;
    var selectedCountryVal = widget.konum.obs;
    var selectedSituationVal = widget.situation.obs;
    controllerBaslik.text = widget.ilanBaslik;
    controllerAcikla.text = widget.ilanAciklama;
    controllerFiyat.text = widget.fiyat;
    controllerKonum.text = widget.konum;
    controllerIletisim.text = widget.iletisim;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: Colors.black,
            elevation: 0,
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.photo_url.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TitleWithCustomUnderline(text: "İlan Bilgileri"),
                  ),
                  Obx(
                    () {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text(
                            "Kategori",
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: DropdownButton<String>(
                            value: selectedcategoryVal.value,
                            items: dropDownCategory.dropDownMenuCategory,
                            onChanged: ((String? newValue) {
                              if (newValue != null) {
                                selectedcategoryVal.value = newValue;
                              }
                              print("seçilen $selectedcategoryVal");
                            }),
                          ),
                        ),
                      );
                    },
                  ),
                  Obx(
                    () {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text(
                            "Durum ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: DropdownButton<String>(
                            value: selectedSituationVal.value,
                            items: dropDownSituation.dropDownMenuSituation,
                            onChanged: ((String? newValue) {
                              if (newValue != null) {
                                selectedSituationVal.value = newValue;
                              }
                              print(
                                  "seçilen $selectedSituationVal ${ucontrol.name}");
                            }),
                          ),
                        ),
                      );
                    },
                  ),
                  Obx(
                    () {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: const Text(
                            "Konum",
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: DropdownButton<String>(
                            value: selectedCountryVal.value,
                            items: dropDownCountry.dropDownMenuCountry,
                            onChanged: ((String? newValue) {
                              if (newValue != null) {
                                selectedCountryVal.value = newValue;
                              }
                              print("seçilen $selectedCountryVal");
                            }),
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextBoxWidget(
                        type: TextInputType.text,
                        title: "İlan Başlığı*",
                        controllerText: controllerBaslik),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextBoxWidget(
                      type: TextInputType.text,
                      title: "Ne Sattığını Açıkla*",
                      controllerText: controllerAcikla,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextBoxWidget(
                      type: TextInputType.number,
                      title: "Fiyat*",
                      controllerText: controllerFiyat,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextBoxWidget(
                      type: TextInputType.number,
                      title: "İletişim*",
                      controllerText: controllerIletisim,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: AnimatedButton(
                      onPress: () {
                        if (controllerBaslik.text != "" ||
                            controllerFiyat.text != "") {
                          firestore
                              .doc(
                                  "ilanImage/${firestore.collection("ilanImage").doc(widget.ilan_id).id}")
                              .update(
                            {
                              "category": selectedcategoryVal.toString(),
                              "situation": selectedSituationVal.toString(),
                              "ilanBaslik": controllerBaslik.text.toString(),
                              "ilanAciklama": controllerAcikla.text.toString(),
                              "fiyat": controllerFiyat.text.toString(),
                              "iletisim": controllerIletisim.text.toString(),
                              "konum": selectedCountryVal.toString(),
                            },
                          );
                          Get.snackbar(
                              "Başarılı", "İlanın başarı ile güncellendi.",
                              backgroundColor: kPrimaryGreenColor,
                              colorText: whiteColor,
                              duration: const Duration(seconds: 2));
                        } else {
                          Get.snackbar(
                              "Uyarı", "Lütfen zorunlu alanları doldurunuz.",
                              backgroundColor: kPrimaryRedColor,
                              colorText: whiteColor,
                              duration: const Duration(seconds: 2));
                        }
                      },
                      text: 'İlanı Güncelle',
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: kPrimaryGreenColor,
                          fontWeight: FontWeight.bold),
                      width: Get.width - 50,
                      isReverse: true,
                      selectedTextColor: whiteColor,
                      selectedBackgroundColor: kPrimaryGreenColor,
                      backgroundColor: whiteColor,
                      borderRadius: 15,
                      borderWidth: 1,
                      borderColor: kPrimaryGreenColor,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: AnimatedButton(
                      onPress: () {
                        if (widget.ilan_id != "") {
                          firestore
                              .doc(
                                  "ilanImage/${firestore.collection("ilanImage").doc(widget.ilan_id).id}")
                              .delete();
                          Get.snackbar("Başarılı", "İlanın başarı ile silindi.",
                              backgroundColor: kPrimaryGreenColor,
                              colorText: whiteColor,
                              duration: const Duration(seconds: 2));
                        } else {
                          Get.snackbar("Dikkat", "$e",
                              backgroundColor: kPrimaryRedColor,
                              colorText: whiteColor,
                              duration: const Duration(seconds: 2));
                        }
                      },
                      text: 'İlanı Sil',
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: kPrimaryRedColor,
                          fontWeight: FontWeight.bold),
                      width: Get.width - 50,
                      isReverse: true,
                      selectedTextColor: whiteColor,
                      selectedBackgroundColor: kPrimaryRedColor,
                      backgroundColor: whiteColor,
                      borderRadius: 15,
                      borderWidth: 1,
                      borderColor: kPrimaryRedColor,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
