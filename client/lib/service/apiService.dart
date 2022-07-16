// ignore_for_file: file_names

import 'dart:convert';
import 'package:frontend/config/config.dart';
import '../models/image.model.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<List<Img>?> getImages() async {
    var url = Uri.http(Config.apiUrl, Config.HomeRoute);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = await http.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    return imagesFromJson(data);
  }

  Future<Img>? getImage(String id) async {
    var url = Uri.http(Config.apiUrl, '${Config.showImage}/$id');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = await http.get(url, headers: requestHeaders);
    var data = jsonDecode(response.body);
    return imageFromJson(data);
  }

  Future<bool> saveImage(Img? img) async {
    var url = Uri.http(Config.apiUrl, Config.newImageRoute);
    var response = await http.post(
      url,
      body: jsonEncode({
        "imgName": img?.imgName ?? 'default',
        "imgUrl": img?.imgUrl ?? Config.noImage,
        "imgDetails": img?.imgDetails ?? 'default'
      }),
    );
    var data = jsonDecode(response.body);
    return data['imageAdded'];
  }

  Future<bool> editImage(Img img) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var url = Uri.http(Config.apiUrl, '/${img.id}/edit');
    var response = await http.put(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        'imgName': img.imgName,
        'imgUrl': img.imgUrl,
        'imgDetails': img.imgDetails
      }),
    );
    var data = jsonDecode(response.body);
    return data['updated'];
  }

  Future<bool> deleteImage(Img img) async {
    var url = Uri.http(Config.apiUrl, '${Config.deleteImage}/${img.id}');
    var response = await http.delete(url);
    var data = jsonDecode(response.body);
    return data['deleted'];
  }
}
