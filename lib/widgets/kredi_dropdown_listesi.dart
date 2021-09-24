import 'package:dinamik_ortalama/constant/app_constants.dart';
import 'package:dinamik_ortalama/helper/data_helpeer.dart';
import 'package:flutter/material.dart';

class KrediDropDownListesi extends StatefulWidget {
  final Function onChangeKredi;

  const KrediDropDownListesi({Key key, @required this.onChangeKredi})
      : super(key: key);

  @override
  _KrediDropDownListesiState createState() => _KrediDropDownListesiState();
}

class _KrediDropDownListesiState extends State<KrediDropDownListesi> {
  double selectedKrediValue = 4;

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
            selectedKrediValue = value;
            widget.onChangeKredi(selectedKrediValue);
          });
        },
        underline: Container(),
        value: selectedKrediValue,
        items: DataHelper.tumDersKredileri(),
      ),
    );
  }
}
