import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

// getData('sifates')
// getData('adab-jawla')
Future<dynamic> getData(String file) async {
  try {
    final contents = await rootBundle.loadString('assets/data/${file}.json');
    final dynamic data = jsonDecode(contents);
    return data;
  } catch (e) {
    print('Erreur lors de la lecture du fichier : $e');
    return [];
  }
}
