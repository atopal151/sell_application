// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

final UserController ucontrol = Get.put(UserController());
AppBar GeneralAppBar(BuildContext context, Color clr, clr2, String image_url) {
  return AppBar(
    backgroundColor: clr,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: SizedBox(
      height: 25,
      child: Image.asset(
        image_url,
        color: clr2,
      ),
    ),
    actions: [
      SizedBox(
        width: 70,
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18,
            backgroundImage: NetworkImage(ucontrol.photo.toString()),
          ),
        ),
      ),
    ],
  );
}
