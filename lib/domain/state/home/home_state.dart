import 'package:gallery_app/domain/model/image_list.dart';
import 'package:gallery_app/domain/repository/image_list_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._imageListRepository);

  final ImageListRepository _imageListRepository;
  int page = 0;
  @observable
  ImageList imageList;

  @observable
  bool isLoading = false;

  @observable
  bool errorLoading = false;

  @action
  Future<void> getImageList() async {
    isLoading = true;
    final data = await _imageListRepository.getImageList(page: page);
    isLoading = false;
    if (data == null || data.images == null || data.images.isEmpty) {
      errorLoading = true;
    } else {
      _fillList(data);
    }
  }

  void _fillList(ImageList data) {
    if (imageList == null)
      imageList = data;
    else
      imageList.images.addAll(data.images);
    errorLoading = false;
    page++;
  }
}
