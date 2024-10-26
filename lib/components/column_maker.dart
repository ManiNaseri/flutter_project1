import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ColumnMaker extends StatelessWidget {
  final IconData? icon;
  final String? gender;

  ColumnMaker({this.icon, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon != null ? Icon(icon, size: 80) : Icon(FontAwesomeIcons.question), // Add a default icon if icon is null
        SizedBox(height: 20),
        Text(gender ?? '', style: TextStyle(
          fontSize: 18,
          color: Color(0xFF8D8E98),
        ))
      ],
    );
  }
}