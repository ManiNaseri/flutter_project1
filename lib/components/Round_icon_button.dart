
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  
  final void Function()? onPressed;
  final IconData? icon;
  
  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56
      ),
      elevation: 6,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      onPressed: onPressed,
    );
  }
}