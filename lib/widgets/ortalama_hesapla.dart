import 'package:dinamik_ortalama/constant/app_constants.dart';
import 'package:dinamik_ortalama/helper/data_helpeer.dart';
import 'package:dinamik_ortalama/model/ders.dart';
import 'package:dinamik_ortalama/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama/widgets/harf_listesi.dart';
import 'package:dinamik_ortalama/widgets/ortalama_g%C3%B6ster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaApp extends StatefulWidget {
  @override
  _OrtalamaHesaplaAppState createState() => _OrtalamaHesaplaAppState();
}

class _OrtalamaHesaplaAppState extends State<OrtalamaHesaplaApp> {
  final _formKey = GlobalKey<FormState>();
  String girilenDers = "";
  double selectedValue = 4;
  double selectedKrediValue = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            StaticVariables.appTitle,
            style: StaticVariables.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                  dersSayisi: DataHelper.tumEklenenDersler.length,
                  ortalama: DataHelper.ortalamaHesapla(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: DersListesi(
              onDismiss: (index) {
                setState(() {
                  DataHelper.tumEklenenDersler.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Form _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: StaticVariables.yatayPadding,
              child: buildTextFormField(),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: StaticVariables.yatayPadding,
                    child: HarfListesi(
                      onHarfChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: StaticVariables.yatayPadding,
                    child: _buildKredilerDropDown(),
                  ),
                ),
                IconButton(
                  onPressed: _dersEkleHesaplaMethod,
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                  iconSize: 30,
                  color: StaticVariables.themeColor,
                ),
              ],
            )
          ],
        ));
  }

  Widget _buildHarflerDropDown() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: StaticVariables.staticBorder,
        color: StaticVariables.themeColor.shade100.withOpacity(0.3),
      ),
      child: DropdownButton<double>(
        onChanged: (value) {
          setState(() {
            selectedValue = value;
            print("seçilen değer: $selectedValue");
          });
        },
        underline: Container(),
        value: selectedValue,
        items: DataHelper.tumDersHarfleri(),
      ),
    );
  }

  Widget _buildKredilerDropDown() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: StaticVariables.staticBorder,
        color: StaticVariables.themeColor.shade100.withOpacity(0.3),
      ),
      child: DropdownButton<double>(
        onChanged: (value) {
          setState(() {
            selectedKrediValue = value;
          });
        },
        underline: Container(),
        value: selectedKrediValue,
        items: DataHelper.tumDersKredileri(),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          girilenDers = value;
        });
      },
      validator: (value) {
        if (value.length <= 0) {
          return "Ders Adını giriniz";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Matematik",
        fillColor: StaticVariables.themeColor.shade100.withOpacity(0.2),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: StaticVariables.staticBorder,
            borderSide: BorderSide.none),
      ),
    );
  }

  void _dersEkleHesaplaMethod() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        var eklenecekDers = Ders(
            dersAdi: girilenDers,
            dersKredi: selectedKrediValue,
            dersHarf: selectedValue);

        DataHelper.dersEkle(eklenecekDers);
      });
    }
  }
}
