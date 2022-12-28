// ignore_for_file: await_only_futures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Screen/login_page/login_page.dart';

class UserController extends GetxController {
  late FirebaseAuth auth;

  final photo = photo1.value.obs;
  final name = name1.value.obs;
  final mailAdress = mailAdress1.value.obs;

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;

    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        mailAdress.value = mailAdress1.value;
        name.value = name1.value;
        photo.value = photo1.value;
      } else {
        mailAdress.value = auth.currentUser!.email!;
        photo.value = auth.currentUser!.photoURL!;
        name.value = auth.currentUser!.displayName!;
      }
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
