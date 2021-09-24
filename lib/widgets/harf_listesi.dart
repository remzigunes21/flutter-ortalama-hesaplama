import 'package:dinamik_ortalama/constant/app_constants.dart';
import 'package:dinamik_ortalama/helper/data_helpeer.dart';
import 'package:flutter/material.dart';

class HarfListesi extends StatefulWidget {
  final Function onHarfChanged;

  const HarfListesi({Key key, @required this.onHarfChanged}) : super(key: key);
  @override
  _HarfListesiState createState() => _HarfListesiState();
}

class _HarfListesiState extends State<HarfListesi> {
  double selectedHarfValue = 4;

  @override
  Widget build(BuildContext context) {
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
            selectedHarfValue = value;
            widget.onHarfChanged(selectedHarfValue);
          });
        },
        underline: Container(),
        value: selectedHarfValue,
        items: DataHelper.tumDersHarfleri(),
      ),
    );
  }
}
