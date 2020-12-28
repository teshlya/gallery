import 'package:gallery_app/domain/model/image_list.dart';
import 'package:meta/meta.dart';

abstract class ImageListRepository {
  Future<ImageList> getImageList({
    @required int page,
  });
}
