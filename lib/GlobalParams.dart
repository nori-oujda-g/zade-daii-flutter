import 'package:flutter/material.dart';
import 'package:zaddaii/pages/home.dart';
import 'package:zaddaii/pages/maksed-fadila-page.dart';
import 'package:zaddaii/pages/sifates-page.dart';

class Globalparams {
  static List<Map<String, dynamic>> menu = [
    {'title': 'الرّئيسيّة', 'icon': Icons.home, 'route': '/'},
    {
      'title': 'السّت صفات',
      'icon': Icons.volunteer_activism,
      'route': '/sifates',
    },
    {'route': '/', 'title': 'test', 'icon': Icons.check_circle},
    {'route': '/', 'title': 'test', 'icon': Icons.thumb_up},
    {'route': '/', 'title': 'test', 'icon': Icons.emoji_emotions},
    {'route': '/', 'title': 'test', 'icon': Icons.favorite},
    {'route': '/', 'title': 'test', 'icon': Icons.star},
    {'route': '/', 'title': 'test', 'icon': Icons.volunteer_activism},
    // {'route': '/','title': 'test', 'icon': Icons.home},
  ];
  static Map<String, Widget Function(dynamic)> routes = {
    '/': (context) => Home(),
    '/sifates': (context) => SifatesPage(),
    '/maksed-fadila': (context) => MaksedFadilaPage(),
  };
}
