import 'package:flutter/material.dart';
import 'package:zaddaii/env.dart';
import 'package:zaddaii/repository/sifates-repo.dart';
import 'package:zaddaii/widgets/MyAppBar.dart';
import 'package:zaddaii/widgets/jomla.dart';

class HidayateRoujouePage extends StatelessWidget {
  const HidayateRoujouePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'هدايات الرّجوع'),
      body: FutureBuilder<dynamic>(
        future: getData('hidayate-roujoue'),
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
                  Jomla(
                    text: 'نلتزم بهذه الصّفات مع الأهل :',
                    color: Colors.red,
                  ),
                  ...sifates['ahl'].asMap().entries.map((entry) {
                    String item = entry.value;
                    return Jomla(text: '${ICON} $item .');
                  }),
                  Jomla(text: 'نحافظ على الخمس أعمال :', color: Colors.red),
                  ...sifates['aamal'].asMap().entries.map((entry) {
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
