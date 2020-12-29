import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gallery_app/domain/state/home/home_state.dart';
import 'package:gallery_app/internal/dependencies/home_module.dart';
import 'package:gallery_app/domain/model/image.dart' as MyImage;

import 'image_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeState _homeState;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    initHomeState();
    initScrollController();
  }

  void initHomeState() {
    _homeState = HomeModule.homeState();
    _homeState.getImageList();
  }

  void initScrollController() {
    _scrollController.addListener(() {
      var triggerFetchMoreSize =
          0.9 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        _homeState.getImageList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 25, 178, 238),
            Color.fromARGB(255, 21, 236, 229)
          ],
        ),
      ),
      child: _getList(),
    );
  }

  Widget _getList() {
    return Observer(builder: (_) {
      if (_homeState.imageList == null || _homeState.imageList.images.isEmpty) {
        if (_homeState.errorLoading)
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text("Error get data from server"),
          ));
        if (_homeState.isLoading) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ));
        } else
          return Container();
      } else
        return _fillList();
    });
  }

  Widget _fillList() {
    return ListView(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        for (var item in _homeState.imageList.images) _getItem(item),
        _homeState.isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              )
            : Container(),
      ],
    );
  }

  Widget _getItem(MyImage.Image image) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: SizedBox(
          height: 130,
          child: Stack(children: <Widget>[
            _getCard(image),
            _onTapCard(image.fullImage),
          ])),
    );
  }

  Widget _getCard(MyImage.Image image) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: _getContainCard(image),
    );
  }

  Widget _onTapCard(String url) {
    return Positioned.fill(
        child: new Material(
            color: Colors.transparent,
            child: new InkWell(
              onTap: () => _openImage(url),
            )));
  }

  _openImage(String url) {
    print("open");
    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScreen(url: url,)));
  }

  Widget _getContainCard(MyImage.Image image) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _getImage(image.smallImage),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              _getAuthor(image.author),
              _getTitle(image.title)
            ],
          ),
        ),
      ],
    );
  }

  Widget _getImage(String url) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Image.network(url),
    );
  }

  Widget _getAuthor(String author) {
    return Text(author != null ? author : "");
  }

  Widget _getTitle(String title) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical, //.horizontal
        child: Text(title != null ? title : ""));
  }
}
