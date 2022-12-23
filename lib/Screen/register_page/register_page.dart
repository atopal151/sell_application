import 'package:cloud_firestore/cloud_firestore.dart';
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
  late TextEditingController controllerName;
  late TextEditingController controllerTwoPassword;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    controllerMail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerName = TextEditingController();
    controllerTwoPassword = TextEditingController();
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
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextBoxWidgetRegister(
                    icons: const Icon(Icons.person),
                    title: "Kullanıcı Adı",
                    controllerText: controllerName,
                    type: TextInputType.text,
                  ),
                  TextBoxWidgetRegister(
                    icons: const Icon(Icons.mail),
                    title: "Email",
                    controllerText: controllerMail,
                    type: TextInputType.text,
                  ),
                  TextBoxWidgetRegister(
                    icons: const Icon(Icons.lock),
                    title: "Şifre",
                    controllerText: controllerPassword,
                    type: TextInputType.number,
                  ),
                  TextBoxWidgetRegister(
                    icons: const Icon(Icons.lock),
                    title: "Şifreyi Onayla",
                    controllerText: controllerTwoPassword,
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
                  if (controllerPassword.text == controllerTwoPassword.text) {
                    firestore
                        .doc("users/${firestore.collection("users").doc().id}")
                        .set({
                      "userName": controllerName.text.toString(),
                      "email": controllerMail.text.toString(),
                      "password": controllerPassword.text.toString(),
                    }, SetOptions(merge: true));

                    Get.snackbar("Başarılı", "Kayıt Tamamlandı.");
                  } else {
                    Get.snackbar("Dikkat!", "Şifrenizi doğru yazın...");
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
          Padding(
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
        ],
      )),
    );
  }
}
