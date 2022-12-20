import 'package:flutter/material.dart';

import '../../../component/component.dart';

AppBar favoriteAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: SizedBox(
        height: 30,
        child: Image.asset(
          "assets/image/favori.png",
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
