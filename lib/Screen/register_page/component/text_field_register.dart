// ignore_for_file: public_member_api_docs, sort_constructors_first, override_on_non_overriding_member
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../component/component.dart';

class TextBoxWidgetRegister extends StatelessWidget {
  TextBoxWidgetRegister({
    Key? key,
    required this.title,
    required this.type,
    required this.controllerText,
    required this.icons,
  }) : super(key: key);
  TextInputType type;
  String title;
  TextEditingController controllerText;
  Icon icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: 54,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          keyboardType: type,
          controller: controllerText,
          cursorColor: kPrimaryRedColor,
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: title,
            prefixIcon: icons,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
