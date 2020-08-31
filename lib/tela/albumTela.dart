import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_album/model/AlbumModel.dart';
import 'package:flutter_album/tela/PhotosTela.dart';
import '../helper/api.dart';

class AlbumTela extends StatefulWidget {
  @override
  _AlbumTelaState createState() => _AlbumTelaState();
}

class _AlbumTelaState extends State<AlbumTela> {
  var albuns = new List<AlbumModel>();

  _getAlbuns() {
    API.getAlbuns().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        albuns = list.map((model) => AlbumModel.fromJson(model)).toList();
      });
    });
  }
  initState() {
    super.initState();
    _getAlbuns();
  }
  dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albuns"),
      ),
      body: ListView.builder(
        itemCount: albuns.length,
        itemBuilder: (context, index) {
          return
              Card(
                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: ListTile(
                      onTap:  () => Navigator.push(
                          context ,
                          MaterialPageRoute( builder: (context) => photosTela( album: albuns[index] ) )
                      ),
                      title: Text(albuns[index].title),
                      subtitle: Text('ID: '+albuns[index].id.toString()),
                  )
              );
            //ListTile(title: Text(albuns[index].title));
        },
      ),
    );
  }

}
