import 'package:flutter/material.dart';
import '../constants.dart';



class BottomButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  BottomButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(title!, style: kCalculatebuttonStyle,)),
          color:Color(0xFFEB1555),
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 80,
            ),
          );
  }
}
