import 'package:gd_api_1604/entity/Barang.dart';

import 'dart:convert';
import 'package:http/http.dart';

class Barangclient {

  static final String url = '192.168.10.56';
  static final String endpoint = '/GD_API_1604/public/api/barang';

  static Future<List<Barang>> fetchAll() async {
    try {
      var response = await get(
        Uri.http(url, endpoint));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body) ['data'];
      return list.map((e) => Barang.fromJson(e)).toList();
    }catch (e){
      return Future.error(e.toString());
    }
  }

  static Future<Barang> find(id) async {
    try {
      var response = await get(Uri.http(url, '$endpoint/$id'));

      if(response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Barang.fromJson(json.decode(response.body)['data']);
    }catch (e) {
      return Future.error(e.toString());
    }
  }

  //membuat data barang baru
  static Future<Response> create(Barang barang) async {
    try {
      var response = await post(Uri.http(url, endpoint),
          headers: {"Content-Type": "application/json"},
          body: barang.toRawJson());

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);
      return response;
    }catch (e) {
      return Future.error(e.toString());
    }
  }

  // static Future<Response> update(Barang barang) async {
  //   try {
  //     var response = await put(Uri.http(url, '$endpoint/${barang.id}'),
  //         headers: {"Content-Type": "application/json"},
  //         body: barang.toRawJson());

  //     if (response.statusCode != 200) throw Exception(response.reasonPhrase);

  //     return response;
  //   }catch (e) {
  //     return Future.error(e.toString());
  //   }
  // }


  static Future<Response> update(Barang barang) async {
    try {
      var response = await put(Uri.http(url, '$endpoint/${barang.id}'),
          headers: {"Content-Type": "application/json"},
          body: barang.toRawJson());

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    }catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<Response> destroy(id) async {
    try {
      var response = await delete(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    }catch (e) {
      return Future.error(e.toString());
    }
  }
    
}