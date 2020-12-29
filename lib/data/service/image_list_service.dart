import 'package:dio/dio.dart';
import 'package:gallery_app/data/api/api_image_list.dart';
import 'package:gallery_app/data/request/get_image_list_body.dart';

class ImageListService {
  static const _BASE_URL = 'https://api.unsplash.com';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<ApiImageList> getImageList(GetImageListBody body) async {
    var response;
    try {
      response = await _dio.get(
        '/photos',
        queryParameters: body.toApi(),
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
    return ApiImageList.fromApi(response.data);
  }
}
