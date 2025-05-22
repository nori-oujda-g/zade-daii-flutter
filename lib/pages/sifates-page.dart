import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/repository/sifates-repo.dart';
import 'package:zaddaii/widgets/MyAppBar.dart';
import 'package:zaddaii/widgets/MyButton.dart';
import 'package:zaddaii/widgets/jomla.dart';

class SifatesPage extends StatelessWidget {
  const SifatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'السّت صفات'),
      body: FutureBuilder<dynamic>(
        future: getData('sifates'),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Jomla(text: '${sifates['begin']} :'),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: sifates['sifates'].length,
                      itemBuilder: (context, index) {
                        final item = sifates['sifates'][index];
                        return Jomla(text: '${index + 1}- $item .');
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/maksed-fadila');
                        },
                        child: 'المقاصد و الفضائل',
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
