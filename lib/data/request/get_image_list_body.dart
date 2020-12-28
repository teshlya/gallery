import 'package:meta/meta.dart';

class GetImageListBody {
  final int page;
  final String clientId =
      "cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0";

  GetImageListBody({
    @required this.page,
  });

  Map<String, dynamic> toApi() {
    return {
      'page': page,
      'client_id': clientId,
      'formatted': 0,
    };
  }
}
