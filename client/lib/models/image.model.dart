// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

import 'package:frontend/config/config.dart';

List<Img> imagesFromJson(dynamic str) =>
    List<Img>.from((str).map((x) => Img.fromJson(x)));

Img imageFromJson(String str) => Img.fromJson(json.decode(str));

String imageToJson(Img data) => json.encode(data.toJson());

class Img {
  Img({
    this.id,
    this.imgName,
    this.imgUrl,
    this.imgDetails,
  });

  String? id;
  String? imgName;
  String? imgUrl;
  String? imgDetails;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        id: json["_id"],
        imgName: json["imgName"] ?? " ",
        imgUrl: json["imgUrl"] ?? Config.noImage,
        imgDetails: json["imgDetails"] ?? " ",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "imgName": imgName,
        "imgUrl": imgUrl,
        "imgDetails": imgDetails,
      };
}
