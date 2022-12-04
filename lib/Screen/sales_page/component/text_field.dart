// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../component/component.dart';

class TextBoxWidget extends StatelessWidget {
  TextBoxWidget({
    Key? key,
    required this.title,
    required this.type,
    required this.controllerText,
  }) : super(key: key);
  TextInputType type;
  String title;
  TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: 54,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              keyboardType: type,
              controller: controllerText,
              cursorColor: kPrimaryRedColor,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: title,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
