import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class ListKolokviumi {
  final String id;
  final String imeNaPredmet;
  final String datumVreme;

  ListKolokviumi({
    required this.id,
    required this.imeNaPredmet,
    required this.datumVreme,
  });
}
