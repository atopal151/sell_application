import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String price = "5000TL",
      title = "Bilgisayar",
      country = "Denizli",
      svgSrc = "assets/image/telefon.jpg";
  final Function() press;
  const ItemCard({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 5, top: 5, bottom: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: const Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: size.height * 0.18,
                  width: size.width * 0.31,
                  padding: const EdgeInsets.all(1),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Image.asset(svgSrc),
                ),
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      country,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
