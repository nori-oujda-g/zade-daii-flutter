import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/repository/sifates-repo.dart';
import 'package:zaddaii/widgets/MyAppBar.dart';
import 'package:zaddaii/widgets/jomla.dart';

class MaksedFadilaPage extends StatelessWidget {
  const MaksedFadilaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'المقاصد و الفضائل'),
      body: FutureBuilder<dynamic>(
        future: getSifates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun élément trouvé.'));
          } else {
            final maksedFadila = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: maksedFadila['maksed-fadila'].length + 1,
                    itemBuilder: (context, index) {
                      if (index < maksedFadila['maksed-fadila'].length) {
                        final sifat =
                            maksedFadila['maksed-fadila'][index]['sifat'];
                        final maksed =
                            maksedFadila['maksed-fadila'][index]['maksed'];
                        final fadila =
                            maksedFadila['maksed-fadila'][index]['fadila'];
                        final deg = 140;
                        return Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Jomla(
                                text: '$sifat :',
                                color: Color.fromRGBO(0, 0, deg, 1),
                              ),
                              Jomla(
                                text: 'المقصد: $maksed .',
                                color: Color.fromRGBO(deg, 0, 0, 1),
                              ),
                              Jomla(
                                text:
                                    'الفضيلة: قَالَ رَسُولُ اللَّهِ ﷺ: ( ${fadila} ) .',
                                color: Color.fromRGBO(0, deg, 0, 1),
                              ),
                              Divider(color: DEFAULT_BACKGROUND, height: 1),
                            ],
                          ),
                        );
                      } else {
                        return Jomla(text: maksedFadila['tachkile']);
                      }
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
