import 'package:flutter/material.dart';
import 'package:zaddaii/GlobalParams.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/widgets/jomla.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: DEFAULT_BACKGROUND,
      shadowColor: DEFAULT_WHITE_FOREGROUND,
      semanticLabel: 'zaaddaii',
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  DEFAULT_BACKGROUND,
                  const Color.fromARGB(255, 53, 216, 12),
                  DEFAULT_BACKGROUND,
                ],
              ),
            ),
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/favicon.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // ...(Globalparams.menu).map(
          //   (item) => ColumnMenu(
          //     title: '${item['title']}',
          //     icon: item['icon'],
          //     route: item['route'],
          //     index: 2,
          //     max: 33,
          //   ),
          // ),
          ...(Globalparams.menu).asMap().entries.map((entry) {
            return ColumnMenu(
              title: '${entry.value['title']} ',
              icon: entry.value['icon'],
              route: entry.value['route'],
              index: entry.key,
              max: (Globalparams.menu).length,
            );
          }),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: const Color.fromARGB(255, 21, 97, 15));
    // return Divider(height: 1, color: DEFAULT_WHITE_FOREGROUND);
  }
}

class ColumnMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final int index;
  final int max;
  const ColumnMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
    required this.index,
    required this.max,
  });
  void getPage(BuildContext context, String page) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, page);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Jomla(text: title, color: DEFAULT_WHITE_FOREGROUND),
          leading: Icon(icon, color: DEFAULT_WHITE_FOREGROUND),
          trailing: Icon(Icons.arrow_right, color: DEFAULT_WHITE_FOREGROUND),
          onTap: () => {getPage(context, route)},
        ),
        if (index < max - 1) MyDivider(),
      ],
    );
  }
}
