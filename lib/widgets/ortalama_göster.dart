import 'package:dinamik_ortalama/constant/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({Key key, this.ortalama, this.dersSayisi})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seçiniz",
          style: StaticVariables.dersSayiStyle,
        ),
        Text(
          ortalama >= 0 ? ortalama.toStringAsFixed(2) : "0.0",
          style: StaticVariables.ortalamaSyiStyle,
        ),
        Text(
          "ortalama",
          style: StaticVariables.ortalamaStyle,
        ),
      ],
    );
  }
}
