// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

final UserController ucontrol = Get.put(UserController());
AppBar GeneralAppBar(BuildContext context, Color clr, clr2) {
  return AppBar(
    backgroundColor: clr,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: SizedBox(
      height: 20,
      child: Image.asset(
        "assets/image/sellme.png",
        color: clr2,
      ),
    ),
    actions: [
      SizedBox(
        width: 90,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            backgroundImage: NetworkImage(ucontrol.photo.toString()),
          ),
        ),
      ),
    ],
  );
}
