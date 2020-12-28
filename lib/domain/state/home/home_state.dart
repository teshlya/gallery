import 'package:gallery_app/domain/model/image_list.dart';
import 'package:gallery_app/domain/repository/image_list_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._imageListRepository);

  final ImageListRepository _imageListRepository;

  @observable
  ImageList imageList;

  @observable
  bool isLoading = false;

  @action
  Future<void> getImageList({
    @required int page,
  }) async {
    isLoading = true;
    final data = await _imageListRepository.getImageList(page: page);
    imageList = data;
    isLoading = false;
  }
}
