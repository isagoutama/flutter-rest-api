import 'package:flutter/material.dart';
import 'package:pelajaran/add_jadwal.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Jadwal extends StatefulWidget {

  Jadwal({this.day});
  final String day;

  @override
  _JadwalState createState() => _JadwalState(dayChoose: day);
}

class _JadwalState extends State<Jadwal> {

  _JadwalState({this.dayChoose});
  final String dayChoose;

  List jadwalJson;

  Future<String> getJadwal() async {
    http.Response resultJadwal = await http.get(
      Uri.encodeFull("http://192.168.43.140/flutter-api/jadwal-pelajaran.php?hari="+dayChoose),
      headers: {"Accept" : "application/json"}
    );

    this.setState((){
      jadwalJson = jsonDecode(resultJadwal.body);
    });
  }

  void deleteJadwal(String id){
    var url = "http://192.168.43.140/flutter-api/delete-jadwal.php?id="+id;
    http.get(url);
    Navigator.pop(context);
  }

  @override
    void initState() {
      // TODO: implement initState
      this.getJadwal();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Jadwal Pelajaran"),),
      body: ListView.builder(
        itemCount: jadwalJson == null ? 0:jadwalJson.length,
        itemBuilder: (context,i){
            return new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(jadwalJson[i]['nama_pelajaran']),
                  subtitle: new Text(jadwalJson[i]['nama_guru']),
                ),
                new FlatButton(
                  child: new Text("Hapus"),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: (){
                    deleteJadwal(jadwalJson[i]['id']);
                  },
                )
              ],
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Jadwal",
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => AddJadwal(addhari: dayChoose,)));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}