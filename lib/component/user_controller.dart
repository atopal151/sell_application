import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController extends GetxController {
  late FirebaseAuth auth;

  final photo = "".obs;
  final name = "".obs;
  final mailAdress = "".obs;

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;
    mailAdress.value = auth.currentUser!.email!;
    photo.value = auth.currentUser!.photoURL!;
    name.value = auth.currentUser!.displayName!;
  }

  void gmailoutuser() async {
    var user = GoogleSignIn().currentUser;
    if (user != null) {
      await GoogleSignIn().currentUser!;
    }
    await auth.signOut();
  }
}
