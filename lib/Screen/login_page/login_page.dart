// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sell_app/Screen/onboard_page/onboard.dart';
import '../../component/component.dart';
import '../register_page/component/text_field_register.dart';

/*
final photo1 = "https://cdn-icons-png.flaticon.com/512/149/149071.png".obs;
final name1 = "Sellme Kullanıcısı".obs;
final mailAdress1 = "".obs;
*/
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FirebaseAuth auth;

  TextEditingController mailadressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mailadressController = TextEditingController();
    passwordController = TextEditingController();
    setState(() {});
    auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.snackbar("Uyarı!", "Açık oturumlu kullanıcı bulunamadı.");
      } else {
        Get.toNamed("/bottomnavbar");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 14,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 180,
                    height: 180,
                    child: Image.asset("assets/image/sellme.png"),
                  ),
                ),
                const Padding(
                    padding:
                        EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                    child: Text(
                      "Log In",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )),
                TextBoxWidgetRegister(
                  obscureText: false,
                  icons: const Icon(Icons.mail),
                  title: "Email",
                  controllerText: mailadressController,
                  type: TextInputType.text,
                ),
                TextBoxWidgetRegister(
                  obscureText: true,
                  icons: const Icon(Icons.lock),
                  title: "Şifre",
                  controllerText: passwordController,
                  type: TextInputType.text,
                ),
                InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Şifremi unuttum!",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: AnimatedButton(
                      onPress: () {
                        if (mailadressController.text == "" &&
                            passwordController.text == "") {
                          Get.snackbar("Uyarı!", "Email ve Şifrenizi girin.");
                        } else {
                          loginEmailAndPassword();
                        }
                      },
                      text: 'Giriş Yap',
                      textStyle:
                          const TextStyle(fontSize: 15, color: Colors.white),
                      height: 50,
                      width: 330,
                      isReverse: true,
                      selectedTextColor: Colors.white,
                      selectedBackgroundColor: kPrimaryRedColor,
                      backgroundColor: kPrimaryRedColor,
                      borderRadius: 15,
                      borderWidth: 1,
                      borderColor: kPrimaryRedColor,
                      transitionType: TransitionType.LEFT_TO_RIGHT,
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Image.asset("assets/image/google.png"),
                            onPressed: () async {
                              gmailLogin();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Image.asset("assets/image/face.png"),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Don't have an account"),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/register");
                          },
                          child: const Text(
                            " Sing Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  void gmailLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void loginEmailAndPassword() async {
    try {
      var userCredential = await auth.signInWithEmailAndPassword(
          email: mailadressController.text, password: passwordController.text);
    } catch (error) {
      Get.snackbar("Uyarı!", "Şifrenizi veya Email adresinizi kontrol edin.");
    }
  }
}
