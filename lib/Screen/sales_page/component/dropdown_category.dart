import 'package:flutter/material.dart';

class DropDownCategoty {
  static const categoryItems = <String>[
    "Diğer",
    "Ev Eşyaları",
    "Elektronik",
    "Giyim",
    "Otomotiv",
    "Sanayi",
    "Tekstil",
    "Hizmet",
    "Bebek",
  ];

  final List<DropdownMenuItem<String>> dropDownMenuCategory = categoryItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();
}
