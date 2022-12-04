// ignore_for_file: unused_element, deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/component/component.dart';
import 'Screen/SplashScreen/splash_screen.dart';
import 'Screen/login_page/login_page.dart';
import 'Screen/register_page/register_page.dart';
import 'component/bottomnavbar.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kPrimaryRedColor,
          secondary: kButtonRegisterColor,
        ),
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      defaultTransition: Transition.native,
      getPages: [
        GetPage(
          name: "/splash",
          page: () => const SplashScreenOne(),
        ),
        GetPage(
          name: "/login",
          page: () => const LoginPage(),
        ),
        GetPage(
          name: "/register",
          page: () => RegisterPage(),
        ),
        GetPage(
          name: "/bottomnavbar",
          page: () => const BottomNavBar(),
        ),
      ],
    );
  }
}
