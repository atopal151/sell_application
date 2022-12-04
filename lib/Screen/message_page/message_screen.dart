import 'package:flutter/material.dart';
import 'package:sell_app/component/component.dart';
import '../../component/general_app_barr.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(context, Colors.white, kPrimaryRedColor),
      body: const Center(),
    );
  }
}
