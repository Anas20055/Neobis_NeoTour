import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.icon,
    required this.padding,
    required this.onPressed,
    required this.background,
  });

  final Widget icon;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: Padding(
        padding: padding,
        child: icon,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.5),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          background,
        ),
      ),
    );
  }
}
