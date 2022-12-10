// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/Screen/favorite_page/component/favorite_app_bar.dart';
import 'package:sell_app/component/component.dart';
import 'package:sell_app/component/user_controller.dart';

import '../../component/get_firebase_share_item..dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);
  UserController uControl = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: favoriteAppbar(context),
        body: TabBarView(children: [
          Center(
            child: FirebaseGetShareItem(
              columnCount: 1,
              mail: uControl.mailAdress.toString(),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Favorilerin ",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Boş",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kPrimaryRedColor),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
