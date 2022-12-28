// ignore_for_file: deprecated_member_use, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../component/component.dart';

final photo1 = "".obs;
final name1 = "".obs;
final mailAdress1 = "".obs;
Map<String, dynamic>? data;

Map<String, dynamic>? data2;

class GetUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Tooltip(message: 'Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SpinKitRing(
            color: kPrimaryRedColor,
            size: 20.0,
          );
        }
        return Column(
            children: snapshot.data!.docs.map(
          (DocumentSnapshot document) {
            data = document.data()! as Map<String, dynamic>;

            return Column(
              children: [
                Text(
                  data!["email"],
                ),
                Text(
                  data!["password"],
                ),
              ],
            );
          },
        ).toList());
      },
    );
  }
}

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
    final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Tooltip(message: 'Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SpinKitRing(
              color: kPrimaryRedColor,
              size: 20.0,
            );
          }
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: snapshot.data!.docs.map(
                (DocumentSnapshot document) {
                  data = document.data()! as Map<String, dynamic>;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data!.toString()),
                    ],
                  );
                },
              ).toList());
        },
      ),
    );
  }

  void gmailLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

/* 
ListView(
              children: snapshot.data!.docs.map(
            (DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "hello",
                  ),
                ],
              );
            },
          ).toList()),



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
                              padding: EdgeInsets.only(
                                  left: 30.0, right: 30.0, top: 20.0),
                              child: Text(
                                "Log In",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 20.0),
                            child: TextFormField(
                              controller: mailadressController,
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
                                left: 30.0,
                                right: 30.0,
                                top: 10.0,
                                bottom: 1.0),
                            child: TextFormField(
                              controller: passwordController,
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
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: AnimatedButton(
                                onPress: () {
                                  if (mailadressController.text ==
                                          data["email"].toString() &&
                                      passwordController.text ==
                                          data["password"].toString()) {
                                    print(mailadressController.text);
                                    name1.value = data["userName"].toString();
                                    mailAdress1.value =
                                        data["email"].toString();
                                    photo1.value =
                                        "https://cdn-icons-png.flaticon.com/512/149/149071.png";
                                    Get.to(const Onboard1sub());
                                  } else {
                                    Get.snackbar(
                                        "Uyarı", data["email"].toString());
                                  }
                                },
                                text: 'Giriş Yap',
                                textStyle: const TextStyle(
                                    fontSize: 15, color: Colors.white),
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
                                      icon: Image.asset(
                                          "assets/image/google.png"),
                                      onPressed: () async {
                                        gmailLogin();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      icon:
                                          Image.asset("assets/image/face.png"),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),*/
