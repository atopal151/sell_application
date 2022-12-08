// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/component/component.dart';
import 'package:sell_app/component/general_app_barr.dart';
import '../../component/get_firebase_item.dart';
import '../../component/user_controller.dart';
import '../sales_page/component/dropdown_category.dart';
import 'component/header_with_search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedcategoryVal = "Diğer".obs;
  DropDownCategoty dropDownCategory = DropDownCategoty();

  late String category = "";

  UserController uctrl = Get.put(UserController());
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
            Obx(
              () {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text(
                      "Kategori",
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: DropdownButton<String>(
                      value: selectedcategoryVal.value,
                      items: dropDownCategory.dropDownMenuCategory,
                      onChanged: ((String? newValue) {
                        if (newValue != null) {
                          selectedcategoryVal.value = newValue;
                        }
                        print("seçilen $selectedcategoryVal");
                        setState(() {});
                      }),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: FirebaseGetItem(
                category: selectedcategoryVal.toString(),
                columnCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
