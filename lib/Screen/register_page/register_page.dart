import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

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
