// ignore_for_file: must_be_immutable, avoid_print, deprecated_member_use, use_key_in_widget_constructors, unnecessary_null_comparison, unrelated_type_equality_checks

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sell_app/Screen/sales_page/component/dropdown_category.dart';
import 'package:sell_app/Screen/sales_page/component/dropdown_situation.dart';
import '../../component/component.dart';
import '../../component/general_app_barr.dart';
import '../../component/user_controller.dart';
import 'component/dropdown_country.dart';
import 'component/text_field.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  DateTime now = DateTime.now();
  final UserController ucontrol = Get.find();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ImagePicker picker = ImagePicker();
  var selectedcategoryVal = "Diğer".obs;
  var selectedCountryVal = "Adana".obs;
  var count = 0.obs;
  var selectedSituationVal = "İyi".obs;
  var imagepath = "".obs;
  XFile? file;

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GeneralAppBar(context, Colors.white, kPrimaryRedColor),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
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
                  controllerText: controllerBaslik,
                ),
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
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        (() => Center(
                              child: imagepath == ""
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            child: const Icon(
                                              Icons.photo,
                                              color: kPrimaryRedColor,
                                              size: 40,
                                            ),
                                            onTap: () async {
                                              try {
                                                file = await picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                                imagepath = file!.path.obs;
                                                setState(() {});
                                              } catch (e) {
                                                Get.snackbar(
                                                  "Hata!",
                                                  "Herhangi bir fotoğraf seçilmedi. ( $e )",
                                                  backgroundColor: whiteColor,
                                                  icon:
                                                      const Icon(Icons.warning),
                                                  colorText: Colors.black,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              child: const Icon(
                                                Icons.camera,
                                                color: kPrimaryRedColor,
                                                size: 40,
                                              ),
                                              onTap: () async {
                                                try {
                                                  file = await picker.pickImage(
                                                      source:
                                                          ImageSource.camera);
                                                  imagepath = file!.path.obs;
                                                  setState(() {});
                                                } catch (e) {
                                                  Get.snackbar(
                                                    "Hata!",
                                                    "Herhangi bir fotoğraf seçilmedi. ( $e )",
                                                    backgroundColor: whiteColor,
                                                    icon: const Icon(
                                                        Icons.warning),
                                                    colorText: Colors.black,
                                                  );
                                                }
                                              },
                                            ))
                                      ],
                                    )
                                  : Image.file(
                                      File(imagepath.toString()),
                                      fit: BoxFit.cover,
                                    ),
                            )),
                      ),
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
                          var ilanImage = FirebaseStorage.instance.ref(
                              "ilanImage/${firestore.collection("ilanImage").doc().id}");
                          var task = ilanImage.putFile(File(file!.path));
                          task.whenComplete(() async {
                            var imageUrl = await ilanImage.getDownloadURL();
                            firestore
                                .doc(
                                    "ilanImage/${firestore.collection("ilanImage").doc().id}")
                                .set({
                              "category": selectedcategoryVal.toString(),
                              "situation": selectedSituationVal.toString(),
                              "ilanBaslik": controllerBaslik.text.toString(),
                              "ilanAciklama": controllerAcikla.text.toString(),
                              "fiyat": controllerFiyat.text.toString(),
                              "iletisim": controllerIletisim.text.toString(),
                              "konum": selectedCountryVal.toString(),
                              "shareUserName": ucontrol.name.toString(),
                              "shareUserMail": ucontrol.mailAdress.toString(),
                              "shareUserPhoto": ucontrol.photo.toString(),
                              "ilanImages": imageUrl.toString(),
                              "ilanTarihi":
                                  "${now.day.toString()}.${now.month.toString()}.${now.year.toString()} ${now.hour.toString()}:${now.minute.toString()}",
                            }, SetOptions(merge: true));
                            Get.snackbar(
                                "Başarılı", "İlanın başarı ile kaydedildi.",
                                backgroundColor: whiteColor,
                                icon: const Icon(Icons.check),
                                colorText: Colors.black,
                                duration: const Duration(seconds: 2));
                          });
                        } else {
                          Get.snackbar(
                              "Uyarı", "Lütfen zorunlu alanları doldurunuz.",
                              backgroundColor: whiteColor,
                              icon: const Icon(Icons.warning),
                              colorText: Colors.black,
                              duration: const Duration(seconds: 2));
                        }
                      },
                      text: 'İlanı Yayınla',
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
            ],
          ),
        ),
      ),
    );
  }
}
