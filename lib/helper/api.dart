import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }

  static Future getAlbuns() {
    var url = baseUrl + "/users/1/albums";
    return http.get(url);
  }

  static Future getGaleria(int albumId) {
    var url = baseUrl + "/albums/"+albumId.toString()+"/photos";
    return http.get(url);
  }
}