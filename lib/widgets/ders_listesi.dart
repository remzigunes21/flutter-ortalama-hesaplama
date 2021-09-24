import 'package:dinamik_ortalama/constant/app_constants.dart';
import 'package:dinamik_ortalama/helper/data_helpeer.dart';
import 'package:dinamik_ortalama/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;

  const DersListesi({Key key, @required this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              var ders = tumDersler[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: ListTile(
                      title: Text(ders.dersAdi),
                      subtitle: Text(
                        ders.dersHarf.toString(),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: StaticVariables.themeColor,
                        child: Text(
                          ders.dersKredi.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Container(
            child: Center(
                child: Text(
              "Lütfen bir ders ekleyin",
              style: StaticVariables.titleStyle,
            )),
          );
  }
}
