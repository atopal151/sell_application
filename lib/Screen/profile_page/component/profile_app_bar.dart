// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/component/component.dart';

import '../../../component/general_app_barr.dart';
import '../../login_page/login_page.dart';

AppBar ProfileAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: SizedBox(
        height: 20,
        child: Image.asset(
          "assets/image/sellme.png",
          color: kPrimaryRedColor,
        )),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            ucontrol.gmailoutuser();
            Get.snackbar("Uyarı", "Çıkış yapıldı.");
            Get.off(const LoginPage());
          },
          icon: const Icon(
            Icons.output,
            color: greyColor,
          ),
        ),
      ),
    ],
  );
}
