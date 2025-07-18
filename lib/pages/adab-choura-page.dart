import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/repository/sifates-repo.dart';
import 'package:zaddaii/widgets/MyAppBar.dart';
import 'package:zaddaii/widgets/jomla.dart';

class AdabChouraPage extends StatelessWidget {
  const AdabChouraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'أدب الشّورى'),
      body: FutureBuilder<dynamic>(
        future: getData('adab-choura'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun élément trouvé.'));
          } else {
            final sifates = snapshot.data!;
            return Padding(
              padding: PADDING,
              child: ListView(
                children: [
                  Jomla(text: 'المقصد من الشّورى :', color: Colors.red),
                  ...sifates['makased'].asMap().entries.map((entry) {
                    int index = entry.key;
                    String item = entry.value;
                    return Jomla(text: '${ICON} $item .');
                  }),
                  Jomla(text: 'أدب الشّورى :', color: Colors.red),
                  ...sifates['adaab'].asMap().entries.map((entry) {
                    String item = entry.value;
                    return Jomla(text: '${ICON} $item .');
                  }),
                  Jomla(text: 'الفضل :', color: Colors.red),
                  ...sifates['fadael'].asMap().entries.map((entry) {
                    String item = entry.value;
                    return Jomla(text: '${ICON} $item .');
                  }),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
