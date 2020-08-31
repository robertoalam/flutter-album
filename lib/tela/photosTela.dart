import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_album/helper/api.dart';
import 'package:flutter_album/model/AlbumModel.dart';
import '../model/PhotoModel.dart';
class photosTela extends StatefulWidget {

  final AlbumModel album;

  photosTela( {Key key , @required this.album} ) : super(key:key);

  @override
  _photosTelaState createState() => _photosTelaState( album );
}

class _photosTelaState extends State<photosTela> {
  var photos = new List<PhotoModel>();
  AlbumModel _album;
  _photosTelaState(AlbumModel album){
    this._album = album;
  }

  _getPhotos() {
    API.getGaleria( this._album.id ).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        photos = list.map((model) => PhotoModel.fromJson(model)).toList();
      });
    });
  }
  initState() {
    super.initState();
    _getPhotos();

  }
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: ListView.builder(
          itemCount: photos.length ,
          itemBuilder: (context, index) {
            return
              Card(
                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start ,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network( photos[index].url , width: 50 ,),
                        Text( photos[index].thumbnailUrl )
                      ],
                    ),
              );
          },
      ),
    );
  }
}
