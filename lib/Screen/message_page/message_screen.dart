import 'package:flutter/material.dart';
import 'package:sell_app/component/component.dart';
import '../../component/general_app_barr.dart';
import '../../get_data_firebase/get_message_list.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: GeneralAppBar(
          context, Colors.white, kPrimaryRedColor, "assets/image/chats.png"),
      body: Center(
        child: GetMessageList(
          userMail: ucontrol.mailAdress.toString(),
        ),
      ),
    );
  }
}
