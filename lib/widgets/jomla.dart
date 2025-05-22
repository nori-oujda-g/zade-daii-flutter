import 'package:flutter/material.dart';

class Jomla extends StatelessWidget {
  String? text;
  Color? color;
  TextAlign? textAlign;
  double? fontSize;
  Jomla({super.key, this.text, this.color, this.textAlign, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // 👈 pour le texte arabe
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Text(
          textAlign: textAlign ?? TextAlign.right,
          text!,
          style: TextStyle(
            fontSize: fontSize ?? 18,
            fontFamily: 'Cairo', // 👈 police arabe (si ajoutée)
            color: color ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
