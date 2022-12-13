import 'package:flutter/material.dart';
import '../../../component/component.dart';
import '../../../component/title_custon_underline.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          const Spacer(),
          // ignore: deprecated_member_use
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: kIconTextColor,
            onPressed: press,
            child: const Text(
              "Daha fazla",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
