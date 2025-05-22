import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/widgets/MyAppBar.dart';
import 'package:zaddaii/widgets/MyMenu.dart';
import 'package:zaddaii/widgets/jomla.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  // GLOBAL_TITLE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyMenu(), //drawer => menu
      appBar: MyAppBar(title: GLOBAL_TITLE),
      body: Center(
        child: Jomla(
          text:
              'وَمَنْ أَحْسَنُ قَوْلًا مِّمَّن دَعَا إِلَى اللَّهِ وَعَمِلَ صَالِحًا وَقَالَ إِنَّنِي مِنَ الْمُسْلِمِينَ',
          color: DEFAULT_BACKGROUND,
          textAlign: TextAlign.center,
          fontSize: 25,
        ),
      ),
    );
  }
}

// class MyAppBar extends StatelessWidget {
//   String? title;
//   MyAppBar({super.key, this.title});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       backgroundColor: Color.fromRGBO(16, 68, 12, 1),
//       title: Text(title!, style: TextStyle(color: Colors.white)),
//       // title: Jomla(text: title),
//     );
//   }
// }
// erreur flutter
// The argument type 'MyAppBar' can't be assigned to the parameter type 'PreferredSizeWidget
// explication en français
