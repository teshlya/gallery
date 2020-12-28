import 'dart:convert';

class Image {
  String smallImage;
  String fullImage;
  String author;
  final String title;

  Image({this.smallImage, this.fullImage, this.author, this.title});

  Image.fromJson(Map<String, dynamic> json)
      : smallImage = json['urls']['small'],
        fullImage = json['urls']['full'],
        author = json['user']['name'],
        title = json['description'];
}
