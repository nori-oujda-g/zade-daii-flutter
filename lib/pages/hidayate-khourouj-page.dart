import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/repository/sifates-repo.dart';
import 'package:zaddaii/widgets/MyAppBar.dart';
import 'package:zaddaii/widgets/jomla.dart';

class HidayateKhouroujPage extends StatelessWidget {
  const HidayateKhouroujPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'هدايات الخروج'),
      body: FutureBuilder<dynamic>(
        future: getData('hidayate-khourouj'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun élément trouvé.'));
          } else {
            final sifates = snapshot.data!;
            int k = 0;
            return Padding(
              padding: PADDING,
              child: ListView(
                children: [
                  Jomla(
                    text: '${sifates['khourouj']['title']} : ',
                    color: Colors.red,
                  ),
                  ...sifates['khourouj']['content'].asMap().entries.map((
                    entry,
                  ) {
                    String item = entry.value;
                    return Jomla(text: '${ICON} $item .');
                  }),
                  Divider(color: DEFAULT_BACKGROUND, height: 1),
                  Jomla(
                    text: '${sifates['aamal']['title']} : ',
                    color: Colors.red,
                  ),
                  ...sifates['aamal']['content'].asMap().entries.map((entry) {
                    dynamic item = entry.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Jomla(
                          text: '${ICON} ${item['title']} : ',
                          color: Colors.blue,
                        ),
                        ...item['content'].asMap().entries.map((entry2) {
                          String item2 = entry2.value;
                          return Jomla(text: '${ICON}${ICON} $item2 .');
                        }),
                        // Divider(color: DEFAULT_BACKGROUND, height: 1),
                      ],
                    );
                  }),
                  Divider(color: DEFAULT_BACKGROUND, height: 1),

                  ...sifates['iltizam'].asMap().entries.map((entry) {
                    dynamic item = entry.value;
                    return Column(
                      // ✅ Corrigé : ListView → Column
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Jomla(text: '${item['title']} : ', color: Colors.red),
                        ...item['content'].asMap().entries.map((entry2) {
                          String item2 = entry2.value;
                          return Jomla(text: '${ICON} $item2 .');
                        }),
                        if (entry.key < sifates['iltizam'].length - 1)
                          Divider(color: DEFAULT_BACKGROUND, height: 1),
                      ],
                    );
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
