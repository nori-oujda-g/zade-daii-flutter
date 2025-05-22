import 'package:flutter/material.dart';
import 'package:zaddaii/GlobalParams.dart';
import 'package:zaddaii/env.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GLOBAL_TITLE,
      debugShowCheckedModeBanner: false, //pour enlever la barriere :debug
      routes: Globalparams.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0x10440c)),
        // primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      // home: HomePage(),
    );
  }
}
