import 'package:lab3_193059/model/list_item.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';

class NovoPolaganje extends StatefulWidget {
  final Function addPolaganje;

  NovoPolaganje(this.addPolaganje);

  @override
  State<StatefulWidget> createState() => _NovoPolaganjeState();
}

class _NovoPolaganjeState extends State<NovoPolaganje> {
  final _imeNaPredmetController = TextEditingController();
  final _datumVremeController = TextEditingController();

  String imeNaPredmet = "";
  String datumVreme = "";

  void _submitData() {
    if (_datumVremeController.text.isEmpty) {
      return;
    }
    final vnesenoImeNaPredmet = _imeNaPredmetController.text;
    final vnesenDatumIVreme = _datumVremeController.text;

    if (vnesenoImeNaPredmet.isEmpty || vnesenDatumIVreme.isEmpty) {
      return;
    }
    final newItem = ListKolokviumi(
        id: nanoid(5),
        imeNaPredmet: vnesenoImeNaPredmet,
        datumVreme: vnesenDatumIVreme);
    widget.addPolaganje(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _imeNaPredmetController,
            decoration: InputDecoration(labelText: "Ime na predmetot"),
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _datumVremeController,
            decoration: InputDecoration(labelText: "Datum i vreme"),
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
          ),
          TextButton(child: Text("Dodaj novo"), onPressed: _submitData
          ),
        ],
      ),
    );
  }
}
