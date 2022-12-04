import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Tümü",
            press: () {},
            isActive: true,
          ),
          CategoryItem(
            title: "Ev Eşyaları",
            isActive: false,
            press: () {},
          ),
          CategoryItem(
            title: "Elektronik",
            isActive: false,
            press: () {},
          ),
          CategoryItem(
            title: "Giyim",
            isActive: false,
            press: () {},
          ),
          CategoryItem(
            title: "Bebek ve Çocuk",
            isActive: false,
            press: () {},
          ),
          CategoryItem(
            title: "Diğer",
            isActive: false,
            press: () {},
          ),
        ],
      ),
    );
  }
}
