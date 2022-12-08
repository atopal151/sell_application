// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../component/component.dart';
import '../onboard_page/onboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
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
      backgroundColor: Colors.white,
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
                      width: 250,
                      height: 210,
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 20.0),
                    child: TextFormField(
                      cursorColor: kSecondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Kullanıcı Adı',
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0, bottom: 1.0),
                    child: TextFormField(
                      cursorColor: kSecondaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Şifre',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
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
                          Get.to(const Onboard1sub());
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
      ),
    );
  }

  void gmailLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    //try  {
    await FirebaseAuth.instance.signInWithCredential(credential);
    /* } catch (e) {
      Get.snackbar("Error!", "$e");
      print(e);
    }*/
  }
}
