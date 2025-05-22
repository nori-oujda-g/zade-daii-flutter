import 'package:flutter/material.dart';

const String GLOBAL_TITLE = 'زاد الدّاعي';
const Color DEFAULT_BACKGROUND = Color.fromRGBO(16, 68, 12, 1);
const Color DEFAULT_WHITE_FOREGROUND = Color.fromRGBO(250, 250, 200, 1);
const String ICON = '🧩';
const EdgeInsets PADDING = EdgeInsets.fromLTRB(0, 10, 8, 10);
final ButtonStyle BUTTON_STYLE = ElevatedButton.styleFrom(
  backgroundColor: DEFAULT_BACKGROUND,
  foregroundColor: DEFAULT_WHITE_FOREGROUND,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  textStyle: TextStyle(fontWeight: FontWeight.bold),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      8,
    ), // 👈 ici tu changes le border radius
  ),
);
