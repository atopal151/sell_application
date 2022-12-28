// ignore_for_file: await_only_futures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Screen/login_page/login_page.dart';

class UserController extends GetxController {
  late FirebaseAuth auth;

  final photo =
      "https://w7.pngwing.com/pngs/1000/665/png-transparent-computer-icons-profile-s-free-angle-sphere-profile-cliparts-free.png"
          .obs;
  final name = "Sell me Kullanıcısı".obs;
  final mailAdress = "".obs;

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((User? user) {
      mailAdress.value = auth.currentUser!.email!;
      photo.value = auth.currentUser!.photoURL!;
      name.value = auth.currentUser!.displayName!;
    });
  }

  void gmailoutuser() async {
    var user = GoogleSignIn().currentUser;
    if (user != null) {
      await GoogleSignIn().currentUser!;
    }
    await auth.signOut();
  }
}
