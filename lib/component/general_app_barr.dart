// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

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
        )),
  );
}
