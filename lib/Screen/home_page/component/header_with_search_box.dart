import 'package:flutter/material.dart';

import '../../../component/component.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
    required this.controllerSearch,
  }) : super(key: key);

  final Size size;
  final TextEditingController controllerSearch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.1,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 10 + kDefaultPadding,
            ),
            height: size.height * 0.1 - 27,
            decoration: const BoxDecoration(
              color: kPrimaryRedColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kSecondaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      cursorColor: kPrimaryRedColor,
                      controller: controllerSearch,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        hintText: "Ara",
                        hintStyle: TextStyle(
                          color: kSecondaryColor,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.search,
                      color: kIconTextColor,
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
