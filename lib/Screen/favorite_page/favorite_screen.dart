import 'package:flutter/material.dart';
import 'package:sell_app/Screen/favorite_page/component/favorite_app_bar.dart';
import 'package:sell_app/Screen/favorite_page/component/product_list.dart';
import 'package:sell_app/component/component.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: favoriteAppbar(context),
        body: TabBarView(children: [
          Column(
            children: [
              ProductCard(
                  itemIndex: 1,
                  press: () {},
                  imgpath: "assets/image/telefon.jpg",
                  title: "Başlık"),
              ProductCard(
                  itemIndex: 1,
                  press: () {},
                  imgpath: "assets/image/bebek.jpg",
                  title: "Başlık"),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Favorilerin ",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
