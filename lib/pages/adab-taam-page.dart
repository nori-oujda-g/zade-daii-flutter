import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/repository/sifates-repo.dart';
import 'package:zaddaii/widgets/MyAppBar.dart';
import 'package:zaddaii/widgets/jomla.dart';

class AdabTaamPage extends StatelessWidget {
  const AdabTaamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'أدب الطّعام'),
      body: FutureBuilder<dynamic>(
        future: getData('adab-taam'),
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
                  ...sifates.asMap().entries.map((entry) {
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
