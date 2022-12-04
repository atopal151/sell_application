import 'package:flutter/material.dart';

import '../../../component/component.dart';

AppBar favoriteAppbar(BuildContext context) {
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
    bottom: const TabBar(
      labelColor: Colors.black,
      indicatorColor: kPrimaryRedColor,
      tabs: [
        Tab(
          text: "İlanlarım",
        ),
        Tab(
          text: "Favoriler",
        ),
      ],
    ),
  );
}
