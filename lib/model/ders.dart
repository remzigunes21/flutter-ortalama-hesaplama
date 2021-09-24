import 'package:flutter/material.dart';

class Ders {
  final String dersAdi;
  final double dersKredi;
  final double dersHarf;

  Ders(
      {@required this.dersAdi,
      @required this.dersKredi,
      @required this.dersHarf});

  @override
  String toString() {
    // TODO: implement toString
    return "$dersAdi \n $dersKredi \n $dersHarf";
  }
}
