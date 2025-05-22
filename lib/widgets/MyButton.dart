import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/widgets/jomla.dart';

class MyButton extends StatelessWidget {
  String child;
  void Function() onPressed;
  MyButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: BUTTON_STYLE,
      onPressed: onPressed,
      child: Jomla(text: child, color: DEFAULT_WHITE_FOREGROUND),
    );
  }
}
