import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../../component/component.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/image/sellme.png')),
                ),
              )),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0),
                    child: TextFormField(
                      cursorColor: kSecondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ad Soyad',
                        prefixIcon: Icon(Icons.person_sharp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0),
                    child: TextFormField(
                      cursorColor: kSecondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0),
                    child: TextFormField(
                      cursorColor: kSecondaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Şifre',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 10.0),
                    child: TextFormField(
                      cursorColor: kSecondaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Şifreyi Onayla',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: (AnimatedButton(
                onPress: () {},
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
          )
        ],
      )),
    );
  }
}
