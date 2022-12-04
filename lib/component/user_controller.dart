import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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
}
