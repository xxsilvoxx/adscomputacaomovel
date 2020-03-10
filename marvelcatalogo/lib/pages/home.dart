import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel catálogo'),
      ),
      body: Center(
        child: Text('Estou na home'),
      ),
    );
  }
}
