import 'package:gallery_app/data/api_util.dart';
import 'package:gallery_app/domain/model/image_list.dart';
import 'package:gallery_app/domain/repository/image_list_repository.dart';

class ImageListDataRepository extends ImageListRepository {
  final ApiUtil _apiUtil;

  ImageListDataRepository(this._apiUtil);

  @override
  Future<ImageList> getImageList({int page}) {
    return _apiUtil.getImageList(page: page);
  }
}
