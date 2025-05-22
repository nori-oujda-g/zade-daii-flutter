import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<dynamic> getSifates() async {
  try {
    final contents = await rootBundle.loadString('assets/data/sifates.json');
    final dynamic sifatesData = jsonDecode(contents);
    return sifatesData;
  } catch (e) {
    print('Erreur lors de la lecture du fichier : $e');
    return [];
  }
}
