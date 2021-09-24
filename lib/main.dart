import 'package:dinamik_ortalama/constant/app_constants.dart';
import 'package:dinamik_ortalama/widgets/ortalama_hesapla.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: StaticVariables.themeColor,
      ),
      home: OrtalamaHesaplaApp(),
    );
  }
}
