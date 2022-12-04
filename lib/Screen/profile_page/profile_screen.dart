// ignore_for_file: await_only_futures, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sell_app/Screen/login_page/login_page.dart';
import 'package:sell_app/component/component.dart';

import '../../component/user_controller.dart';
import 'component/profile_app_bar.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final UserController ucontrol = Get.put(UserController());

  final _switchVal = false.obs;
  // late FirebaseAuth auth;

  /* void gmailoutuser() async {
    var user = GoogleSignIn().currentUser;
    if (user != null) {
      await GoogleSignIn().currentUser!;
    }
    await auth.signOut();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProfileAppBar(context),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
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
            Row(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Çıkış Yap"),
                IconButton(
                  onPressed: () {
                    ucontrol.gmailoutuser();
                    Get.snackbar("Uyarı", "Çıkış yapıldı.");
                    Get.off(const LoginPage());
                  },
                  icon: const Icon(
                    Icons.output,
                    color: kPrimaryRedColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late FirebaseAuth auth;
  late String photo;
  late String name;
  late String mailAdress;
  bool _switchVal = false;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    mailAdress = auth.currentUser!.email!;
    photo = auth.currentUser!.photoURL!;
    name = auth.currentUser!.displayName!;
  }

  void gmailoutuser() async {
    var user = GoogleSignIn().currentUser;
    if (user != null) {
      await GoogleSignIn().currentUser!;
    }
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProfileAppBar(context),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                  backgroundImage: NetworkImage(photo),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      mailAdress,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Dark Mode"),
                Center(
                  child: Switch(
                    activeColor: kPrimaryRedColor,
                    onChanged: (bool value) {
                      setState(() {
                        _switchVal = value;
                        Get.changeTheme(
                          Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                        );
                      });
                    },
                    value: _switchVal,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Çıkış Yap"),
                IconButton(
                  onPressed: () {
                    gmailoutuser();
                    Get.snackbar("Uyarı", "Çıkış yapıldı.");
                    Get.off(const LoginPage());
                  },
                  icon: const Icon(
                    Icons.output,
                    color: kPrimaryRedColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/