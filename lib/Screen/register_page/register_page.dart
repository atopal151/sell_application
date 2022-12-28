import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import '../../component/component.dart';
import 'component/text_field_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController controllerMail;
  late TextEditingController controllerPassword;
  late TextEditingController controllerPasswordTwo;

  late FirebaseAuth auth;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    auth = FirebaseAuth.instance;
    controllerMail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerPasswordTwo = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: SizedBox(
                      height: 180,
                      width: 180,
                      child: Image.asset('assets/image/sellme.png')),
                ),
              )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextBoxWidgetRegister(
                    obscureText: false,
                    icons: const Icon(Icons.mail),
                    title: "Email",
                    controllerText: controllerMail,
                    type: TextInputType.text,
                  ),
                  TextBoxWidgetRegister(
                    obscureText: true,
                    icons: const Icon(Icons.lock),
                    title: "Şifre",
                    controllerText: controllerPassword,
                    type: TextInputType.number,
                  ),
                  TextBoxWidgetRegister(
                    obscureText: true,
                    icons: const Icon(Icons.lock),
                    title: "Şifreni Onayla",
                    controllerText: controllerPasswordTwo,
                    type: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (AnimatedButton(
                onPress: () {
                  if (controllerPassword == controllerPasswordTwo) {
                    createUserEmailAndPassword();
                  } else {
                    Get.snackbar("Uyarı", "Lütfen şifrenizi doğru girin.");
                  }
                },
                text: 'Kayıt ol',
                height: 50,
                width: 330,
                isReverse: true,
                selectedTextColor: kPrimaryRedColor,
                backgroundColor: kPrimaryRedColor,
                borderRadius: 15,
                borderWidth: 1,
                borderColor: kPrimaryRedColor,
                transitionType: TransitionType.LEFT_TO_RIGHT,
              )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do you have an account "),
                  InkWell(
                    onTap: () {
                      Get.toNamed("/login");
                    },
                    child: const Text(
                      " Sing In",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void createUserEmailAndPassword() async {
    try {
      var userCredential = (await auth.createUserWithEmailAndPassword(
        email: controllerMail.text,
        password: controllerPassword.text,
      ))
          .user;
    } catch (error) {
      Get.snackbar("Uyarı!", "Bu Email adresi zaten kullanılıyor.");
    }
  }
}
