// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on HomeStateBase, Store {
  final _$imageListAtom = Atom(name: 'HomeStateBase.imageList');

  @override
  ImageList get imageList {
    _$imageListAtom.reportRead();
    return super.imageList;
  }

  @override
  set imageList(ImageList value) {
    _$imageListAtom.reportWrite(value, super.imageList, () {
      super.imageList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStateBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getImageListAsyncAction = AsyncAction('HomeStateBase.getImageList');

  @override
  Future<void> getImageList() {
    return _$getImageListAsyncAction.run(() => super.getImageList());
  }

  @override
  String toString() {
    return '''
imageList: ${imageList},
isLoading: ${isLoading}
    ''';
  }
}
