import 'package:flutter/material.dart';
class MyBox extends StatelessWidget {
final Widget? child;
final Color? color;
   const MyBox({super.key,required this.color,required this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: child,
      ),
    );
  }
}
