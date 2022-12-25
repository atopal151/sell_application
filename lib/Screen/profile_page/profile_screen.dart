// ignore_for_file: await_only_futures, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/component/component.dart';
import '../../component/user_controller.dart';
import 'component/profile_app_bar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final UserController ucontrol = Get.put(UserController());

  final _switchVal = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProfileAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 55,
                backgroundImage: NetworkImage(ucontrol.photo.toString()),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ucontrol.name.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ucontrol.mailAdress.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Dark Mode"),
                Center(
                  child: Switch(
                    activeColor: kPrimaryRedColor,
                    onChanged: (bool value) {
                      _switchVal.value = value;
                      Get.changeTheme(
                        Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                      );
                    },
                    value: _switchVal.value,
                  ),
                ),
              ],
            );
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(child: Center(child: Text("Uygulamayı Paylaş"))),
                Expanded(
                  child: Center(
                      child: InkWell(
                    child: const Icon(
                      Icons.share,
                      color: kPrimaryRedColor,
                    ),
                    onTap: () {
                      Get.snackbar("Merhaba!", "Uygulamayı Paylaş",
                          backgroundColor: whiteColor,
                          icon: const Icon(Icons.share),
                          colorText: Colors.black,
                          duration: const Duration(seconds: 2));
                    },
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(child: Center(child: Text("İletişim"))),
                Expanded(
                  child: Center(
                      child: InkWell(
                    child: const Icon(
                      Icons.phone,
                      color: kPrimaryRedColor,
                    ),
                    onTap: () {
                      Get.snackbar("Merhaba!", "İletişim",
                          backgroundColor: whiteColor,
                          icon: const Icon(Icons.phone),
                          colorText: Colors.black,
                          duration: const Duration(seconds: 2));
                    },
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(child: Center(child: Text("Puan ver"))),
                Expanded(
                  child: Center(
                      child: InkWell(
                    child: const Icon(
                      Icons.star,
                      color: kPrimaryRedColor,
                    ),
                    onTap: () {
                      Get.snackbar("Merhaba!", "Puan ver",
                          backgroundColor: whiteColor,
                          icon: const Icon(Icons.star),
                          colorText: Colors.black,
                          duration: const Duration(seconds: 2));
                    },
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
