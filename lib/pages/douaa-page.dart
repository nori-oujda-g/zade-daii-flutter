import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/repository/sifates-repo.dart';
import 'package:zaddaii/widgets/MyAppBar.dart';
import 'package:zaddaii/widgets/jomla.dart';

class DouaaPage extends StatelessWidget {
  const DouaaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'الأدعية'),
      body: FutureBuilder<dynamic>(
        future: getData('douaa'),
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
                    dynamic item = entry.value;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Jomla(
                            text: '${item['title']} :',
                            color: Colors.red,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Jomla(text: ' ${item['content']} .'),
                        ),
                        if (entry.key < sifates.length - 1)
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
