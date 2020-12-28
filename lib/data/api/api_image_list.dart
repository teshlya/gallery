import 'package:gallery_app/domain/model/image.dart';
import 'package:gallery_app/domain/model/image_list.dart';

class ApiImageList {
  final List<Image> images;

  ApiImageList.fromApi(List<dynamic> map)
      :  images = ImageList.fromJson(map).images;
}
