import 'package:dio/dio.dart';
import 'package:gallery_app/data/api/api_image_list.dart';
import 'package:gallery_app/data/request/get_image_list_body.dart';

class ImageListService {
  static const _BASE_URL = 'https://api.unsplash.com';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<ApiImageList> getImageList(GetImageListBody body) async {
    final response = await _dio.get(
      '/photos',
      queryParameters: body.toApi(),
    );
    return ApiImageList.fromApi(response.data);
  }
}
