import 'package:gallery_app/data/repository/image_list_data_repository.dart';
import 'package:gallery_app/domain/repository/image_list_repository.dart';
import 'api_module.dart';

class RepositoryModule {
  static ImageListRepository _dayRepository;

  static ImageListRepository dayRepository() {
    if (_dayRepository == null) {
      _dayRepository = ImageListDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _dayRepository;
  }
}
