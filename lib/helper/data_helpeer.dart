import 'package:dinamik_ortalama/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenenDersler.forEach((element) {
      toplamNot = toplamNot + (element.dersKredi * element.dersHarf);
      toplamKredi += element.dersKredi;
    });
    return toplamNot / toplamKredi;
  }

  static List<String> _tumDerslerinHarfleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;

      case "BA":
        return 3.5;

      case "BB":
        return 3;

      case "BC":
        return 2.5;

      case "CC":
        return 2;

      case "DC":
        return 1.5;

      case "DD":
        return 1;

      case "FD":
        return 0.5;

      case "FF":
        return 0.0;

      default:
        return -1;
    }
  }

  static List<DropdownMenuItem<double>> tumDersHarfleri() {
    return _tumDerslerinHarfleri()
        .map(
          (String e) => DropdownMenuItem(
            child: Text(e),
            value: _harfiNotaCevir(e),
          ),
        )
        .toList();
  }

  static List<int> _tunKerediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> tumDersKredileri() {
    return _tunKerediler()
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e.toString(),
            ),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
