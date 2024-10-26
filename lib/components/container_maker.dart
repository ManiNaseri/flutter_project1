import 'package:flutter/material.dart';




class ContainerMaker extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final void Function()? onPress;
  ContainerMaker({this.color, this.child, this.onPress});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.fromLTRB(20,0,20,15),
        decoration: BoxDecoration(
          color: color ?? Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}

