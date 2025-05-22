import 'package:flutter/material.dart';
import 'package:zaddaii/pages/adab-choura-page.dart';
import 'package:zaddaii/pages/adab-joula-page.dart';
import 'package:zaddaii/pages/adab-mawm-page.dart';
import 'package:zaddaii/pages/adab-taalim-page.dart';
import 'package:zaddaii/pages/adab-taam-page.dart';
import 'package:zaddaii/pages/douaa-page.dart';
import 'package:zaddaii/pages/hidayate-khourouj-page.dart';
import 'package:zaddaii/pages/hidayate-roujoue-page.dart';
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
    {
      'title': 'أدب الجولة',
      'icon': Icons.directions_walk,
      'route': '/adab-joula',
    },
    {'title': 'أدب التّعليم', 'icon': Icons.menu_book, 'route': '/adab-taalim'},
    {
      'title': 'أدب الشّورى',
      'icon': Icons.library_books_outlined,
      'route': '/adab-choura',
    },
    {'title': 'أدب الطّعام', 'icon': Icons.food_bank, 'route': '/adab-taam'},
    {'title': 'أدب النّوم', 'icon': Icons.bed_rounded, 'route': '/adab-nawm'},
    {
      'title': 'هدايات الخروج',
      'icon': Icons.arrow_forward,
      'route': '/hidayate-khourouj',
    },
    {
      'title': 'هدايات الرّجوع',
      'icon': Icons.arrow_back,
      'route': '/hidayate-roujoue',
    },
    {'title': 'الأدعية', 'icon': Icons.self_improvement, 'route': '/douaa'},
  ];
  static Map<String, Widget Function(dynamic)> routes = {
    '/': (context) => Home(),
    '/sifates': (context) => SifatesPage(),
    '/maksed-fadila': (context) => MaksedFadilaPage(),
    '/adab-joula': (context) => AdabJawlaPage(),
    '/adab-taalim': (context) => AdabTaalimPage(),
    '/adab-choura': (context) => AdabChouraPage(),
    '/adab-taam': (context) => AdabTaamPage(),
    '/adab-nawm': (context) => AdabNawmPage(),
    '/hidayate-khourouj': (context) => HidayateKhouroujPage(),
    '/hidayate-roujoue': (context) => HidayateRoujouePage(),
    '/douaa': (context) => DouaaPage(),
  };
}
