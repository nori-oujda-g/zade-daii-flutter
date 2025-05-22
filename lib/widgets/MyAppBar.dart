import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/widgets/jomla.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  Color? color;
  MyAppBar({super.key, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: DEFAULT_WHITE_FOREGROUND),
      backgroundColor: DEFAULT_BACKGROUND,
      // title: Text(title!, style: TextStyle(color: Colors.white)),
      title: Jomla(text: title, color: color ?? DEFAULT_WHITE_FOREGROUND),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
