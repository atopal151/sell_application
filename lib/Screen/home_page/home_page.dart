import 'package:flutter/material.dart';
import 'package:sell_app/component/component.dart';
import 'package:sell_app/component/general_app_barr.dart';
import '../../component/get_firebase_item.dart';
import 'component/category_list.dart';
import 'component/header_with_search_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GeneralAppBar(context, kPrimaryRedColor, Colors.white),
      body: SafeArea(
        child: Column(
          children: [
            HeaderWithSearchBox(
              size: size,
            ),
            const CategoryList(),
            /*TitleWithMoreBtn(
              press: () {},
              title: 'Güncel İlanlar',
            ),*/
            Expanded(
              child: FirebaseGetItem(
                columnCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}