import 'package:flutter/material.dart';
import 'package:zaddaii/GlobalParams.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/widgets/jomla.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      shadowColor: Colors.amber,
      semanticLabel: 'zzzaaa',
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  DEFAULT_BACKGROUND,
                  DEFAULT_WHITE_FOREGROUND,
                  DEFAULT_BACKGROUND,
                ],
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/favicon.png'),
                    radius: 50,
                  ),
                ],
              ),
            ),
          ),
          ...(Globalparams.menu).map(
            (item) => ColumnMenu(
              title: item['title'],
              icon: item['icon'],
              route: item['route'],
            ),
          ),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: DEFAULT_WHITE_FOREGROUND);
  }
}

class ColumnMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  const ColumnMenu({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
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
          // title: Text(title, style: TextStyle(fontSize: 22)),
          title: Jomla(text: title, color: DEFAULT_WHITE_FOREGROUND),
          leading: Icon(icon, color: DEFAULT_WHITE_FOREGROUND),
          trailing: Icon(Icons.arrow_right, color: DEFAULT_WHITE_FOREGROUND),
          onTap: () => {getPage(context, route)},
        ),
        MyDivider(),
      ],
    );
  }
}
