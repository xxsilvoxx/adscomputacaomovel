import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String texto;

  const SecondPage({Key key, @required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda página'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Segunda tela',
              style: TextStyle(fontSize: 50.0),
            ),
            Text(
              texto,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
