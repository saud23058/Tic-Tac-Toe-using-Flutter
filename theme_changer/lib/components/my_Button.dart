import 'package:flutter/material.dart';
class MyButton extends StatefulWidget {
  final Color? color;
  final void Function()? onTap;
  const MyButton({super.key,required this.color,required this.onTap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Center(child: Text('Tap')),
        ),
      ),
    );
  }
}
