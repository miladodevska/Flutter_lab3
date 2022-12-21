import 'dart:io';
import 'package:lab3_193059/model/list_item.dart';
import 'package:lab3_193059/widgets/new_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Laboratoriska 3 - 193059',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey)
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListKolokviumi> _userKolokviumi = [
    ListKolokviumi(id: "PartalExam1", imeNaPredmet: "MIS", datumVreme: "13.10.2022 18:00"),
    ListKolokviumi(id: "Exam", imeNaPredmet: "VIS", datumVreme: "22.01.2022 12:00"),
    ListKolokviumi(id: "PartalExam2", imeNaPredmet: "APS", datumVreme: "17.01.2022 15:00"),
  ];

  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: NovoPolaganje(_addNewItemToList),
              behavior: HitTestBehavior.opaque);
        });
  }

  void _addNewItemToList(ListKolokviumi item) {
    setState(() {
      _userKolokviumi.add(item);
    });
  }

  void _deleteItem(String id) {
    setState(() {
      _userKolokviumi.removeWhere((elem) => elem.id == id);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text("Lista od kolokviumi"),
          actions: <Widget>[
            IconButton(
                onPressed: () => _addItemFunction(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: Center(
          child: _userKolokviumi.isEmpty
              ? Text("Nema polaganja")
              : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 8,
                ),
                child: ListTile(
                    title: Text(_userKolokviumi[index].imeNaPredmet,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text("${_userKolokviumi[index].datumVreme}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteItem(_userKolokviumi[index].id),
                    )),
              );
            },
            itemCount: _userKolokviumi.length,
          ),
        ),);
  }
}
