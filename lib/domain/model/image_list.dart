import 'package:gallery_app/domain/model/image.dart';

class ImageList {
  final List<Image> images;

  ImageList({
    this.images,
  });

  factory ImageList.fromJson(List<dynamic> json) {
    List<Image> images = json.map((i)=>Image.fromJson(i)).toList();

    return new ImageList(
      images: images,
    );
  }
}
