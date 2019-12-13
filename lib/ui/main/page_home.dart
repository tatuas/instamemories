import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldGlobalKey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldGlobalKey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.access_time), onPressed: () => _showSnackBar()),
          title: Text('Instamemories'),
          actions: null,
        ),
        body: Builder(
          builder: (BuildContext context) => _HomeBody(),
        ));
  }

  _showSnackBar() {
    _scaffoldGlobalKey.currentState
        .showSnackBar(SnackBar(content: Text("Hava a good day!")));
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Show memory detail'),
        onPressed: () => Navigator.of(context).pushNamed('/detail'),
      ),
    );
  }
}
