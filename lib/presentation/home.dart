import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gallery_app/domain/state/home/home_state.dart';
import 'package:gallery_app/internal/dependencies/home_module.dart';
import 'package:gallery_app/domain/model/image.dart' as MyImage;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeState _homeState;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
    _homeState.getImageList();
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
      child: _getImageList(),
    );
  }

  Widget _getCard(MyImage.Image image) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: SizedBox(
        height: 130,
        child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: _getContainCard(image),
        ),
      ),
    );
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
        )
      ],
    );
  }

  Widget _getImage(String url) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Image.network(url));
  }

  Widget _getAuthor(String author) {
    return Text(author != null ? author : "");
  }

  Widget _getTitle(String title) {
    return Text(title != null ? title : "");
  }

  Widget _getImageList() {
    return Observer(builder: (_) {
      if (_homeState.imageList == null || _homeState.imageList.images.isEmpty) {
        if (_homeState.isLoading) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ));
        } else
          return Container();
      } else
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _homeState.imageList.images.length,
            itemBuilder: (context, index) {
              return _getCard(_homeState.imageList.images[index]);
            });
    }

        /*if (_homeState.isLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (_homeState.imageList.images == null) return Container(color: Colors.red,);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('${_homeState.imageList.images[0].title}'),
            Text('${_homeState.imageList.images[1].title}'),
            Text('${_homeState.imageList.images[2].title}'),
            Text('${_homeState.imageList.images[3].title}'),

          ],
        );*/
        );
  }
}
