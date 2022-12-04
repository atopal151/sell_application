import 'package:flutter/material.dart';

class DropDownSituation {
  static const situationItems = <String>[
    "Yeni",
    "Yeni Gibi",
    "İyi",
    "Makul",
    "Yıpranmış",
  ];

  final List<DropdownMenuItem<String>> dropDownMenuSituation = situationItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();
}
