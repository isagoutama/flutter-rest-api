import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Pelajaran extends StatefulWidget {
  @override
  _PelajaranState createState() => _PelajaranState();
}
class _PelajaranState extends State<Pelajaran> {

  List pelajaranJson;

  Future<String> getPelajaran() async {
    http.Response resultPelajaran = await http.get(
      Uri.encodeFull("http://192.168.43.140/flutter-api/list-pelajaran.php"),
      headers: {"Accept" : "application/json"}
    );

    this.setState((){
      pelajaranJson = jsonDecode(resultPelajaran.body);
    });
  }

  @override
    void initState() {
      // TODO: implement initState
      this.getPelajaran();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Mata Pelajaran"),),
      body: new ListView.builder(
        itemCount: pelajaranJson == null ? 0 : pelajaranJson.length,
        itemBuilder: (context,i){
          return new ListTile(
            title: new Text("${pelajaranJson[i]['nama_pelajaran']}"),
          );
        }
      ),
    );
  }
}