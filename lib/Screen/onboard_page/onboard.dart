import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/component/bottomnavbar.dart';
import 'package:sell_app/component/general_app_barr.dart';
import 'component/slide.dart';

class Onboard1sub extends StatefulWidget {
  const Onboard1sub({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Onboard1subState createState() => _Onboard1subState();
}

class _Onboard1subState extends State<Onboard1sub> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Slide(
                  hero: SizedBox(
                    width: 180,
                    child: Image.asset("assets/image/shops.png"),
                  ),
                  title: "Hoşgeldin ${ucontrol.name}",
                  subtitle:
                      "With our help, it will be easier to achieve your goals",
                  onNext: startPage),
            ]),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  void startPage() {
    Get.to(const BottomNavBar());
  }
}
