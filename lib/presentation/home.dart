import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
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
      child: _getListImages(),
    );
  }

  Widget _getListImages() {
    return Column(
      children: [
        SizedBox(height: 25),
        _getCard(),
      ],
    );
  }

  Widget _getCard() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: SizedBox(
        height: 130,
        child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: _getContainCard(),
        ),
      ),
    );
  }

  Widget _getContainCard() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _getImage(),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              _getAuthor(),
              _getTitle(),
            ],
          ),
        )
      ],
    );
  }

  Widget _getImage() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Image.network(
          "https://images.unsplash.com/photo-1593642532009-6ba71e22f468?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwzMjQ1NnwxfDF8YWxsfDF8fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=400"),
    );
  }

  Widget _getAuthor() {
    return Text("XPS");
  }

  Widget _getTitle() {
    return Text("silver laptop on brown wooden table");
  }
}
