

import 'package:gallery_app/data/request/get_image_list_body.dart';
import 'package:gallery_app/data/service/image_list_service.dart';
import 'package:gallery_app/domain/model/image_list.dart';
import 'package:meta/meta.dart';

class ApiUtil {
  final ImageListService _imageListService;

  ApiUtil(this._imageListService);

  Future<ImageList> getImageList({
    @required int page,
  }) async {
    final body = GetImageListBody(page : page);
    final result = await _imageListService.getImageList(body);
    return ImageList(images:result.images);
  }
}
