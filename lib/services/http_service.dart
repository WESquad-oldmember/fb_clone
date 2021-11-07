import 'dart:convert';
import 'package:exercice_fb_clone/models/album_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<List<Album>> fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      List<Album> albums = [];
      List<dynamic> albumsJson = jsonDecode(response.body);

      albums.addAll(albumsJson.map((album) => Album.fromJson(album)));

      return albums;
    } else {
      throw Exception('Failed to load albums');
    }
  }
}
