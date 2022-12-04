// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sell_app/component/component.dart';

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
  );
}
