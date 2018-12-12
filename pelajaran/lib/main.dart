import 'package:flutter/material.dart';
import 'package:pelajaran/guru.dart';
import 'package:pelajaran/jadwal.dart';
import 'package:pelajaran/pelajaran.dart';

void main() {
  runApp(new MaterialApp(
    title: "Jadwal Saya",
    home: new Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<String> hari = ["Senin","Selasa","Rabu","Kamis", "Jumat","Data Mata Pelajaran","Data Guru"];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Hari"),),
      body: new ListView.builder(
        itemCount: hari.length,
        itemBuilder: (context,i){
          if(hari[i] == "Data Mata Pelajaran"){
                return new ListTile(
                  leading: new Icon(Icons.desktop_windows),
                  title: new Text("${hari[i]}"),
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Pelajaran()));
                  }

              );
          }else if(hari[i] == "Data Guru"){
                return new ListTile(
                  leading: new Icon(Icons.contacts),
                  title: new Text("${hari[i]}"),
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Guru()));
                  }

              );
          }else{
            return new ListTile(
                  leading: new Icon(Icons.view_day),
                  title: new Text("${hari[i]}"),
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Jadwal(day: hari[i],)));
                  }

              );
          }
        }
      ),

    );
  }
}
