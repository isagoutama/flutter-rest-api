import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Guru extends StatefulWidget {
  @override
  _GuruState createState() => _GuruState();
}
class _GuruState extends State<Guru> {

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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Guru"),),
      body: new ListView.builder(
        itemCount: guruJson == null ? 0 : guruJson.length,
        itemBuilder: (context,i){
          return new ListTile(
            title: new Text("${guruJson[i]['nama_guru']}"),
            subtitle: new Text("${guruJson[i]['nama_pelajaran']}"),
          );
        }
      ),
    );
  }
}
