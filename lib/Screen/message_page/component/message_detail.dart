import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sell_app/Screen/message_page/component/message_box.dart';
import 'package:sell_app/component/component.dart';
import 'package:sell_app/get_data_firebase/get.message.dart';

class MessageDetails extends StatefulWidget {
  const MessageDetails({
    Key? key,
    required this.userName,
    required this.userPhoto,
    required this.userMail,
  }) : super(key: key);
  final String userName;
  final String userPhoto;
  final String userMail;

  @override
  State<MessageDetails> createState() => _MessageDetailsState();
}

class _MessageDetailsState extends State<MessageDetails> {
  late TextEditingController controllerMessage;

  @override
  void initState() {
    super.initState();
    controllerMessage = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: NetworkImage(widget.userPhoto.toString()),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.userName,
              style: const TextStyle(color: Colors.black87, fontSize: 15),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 20,
              child: GetMessage(
                columnCount: 1,
                userMail: widget.userMail.toString(),
              )),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MessageBox(
                  shareUserName: widget.userName,
                  size: size,
                  controllerMessage: controllerMessage,
                  shareMail: widget.userMail,
                  shareUserPhoto: widget.userPhoto,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
