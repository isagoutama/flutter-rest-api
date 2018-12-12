import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:pelajaran/jadwal.dart';


class AddJadwal extends StatefulWidget {
  AddJadwal({this.addhari});
  final String addhari;
  @override
  _AddJadwalState createState() => _AddJadwalState(sethari: addhari);
}

class _AddJadwalState extends State<AddJadwal> {

  _AddJadwalState({this.sethari});

  final String sethari;

  String _guru;

  List guruJson;

  Future<String> getGuru() async {
    http.Response resultGuru = await http.get(
      Uri.encodeFull("http://192.168.43.140/flutter-api/list-guru.php"),
      headers: {"Accept" : "application/json"}
    );

    this.setState((){
      guruJson = jsonDecode(resultGuru.body);
    });
  }

  @override
    void initState() {
      // TODO: implement initState
      this.getGuru();
    }

    void postData(){
      var uri = "http://192.168.43.140/flutter-api/post-jadwal.php";
      http.post(uri, body: {
        "id_guru": _guru,
        "hari": sethari,
      });
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Add Jadwal"),),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new DropdownButton(
              items: guruJson.map((item){
                return new DropdownMenuItem(
                  child: new Text(item['nama_guru']),
                  value: item['id'],
                );
              }).toList(),
              onChanged: (newVal){
                setState(() {
                                  _guru = newVal;
                                });
                                print(sethari);
              },
              value: _guru,
            ),
          ),

          new Container(
            child: new Center(
              child: new RaisedButton(
                child: new Text("Submit"),
                onPressed: (){
                  postData();
                  Navigator.pop(this.context);
                },
              ),
            ),
          )
        ],
      )
    );
  }
}