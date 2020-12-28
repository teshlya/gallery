import 'package:gallery_app/data/api_util.dart';
import 'package:gallery_app/data/service/image_list_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(ImageListService());
    }
    return _apiUtil;
  }
}
