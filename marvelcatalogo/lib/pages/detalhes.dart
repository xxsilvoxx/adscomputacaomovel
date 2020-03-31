import 'package:flutter/material.dart';
import 'package:marvelcatalogo/models/character.dart';

class Detalhes extends StatelessWidget {
  final Character character;

  const Detalhes({Key key, @required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Container(
        child: Text(character.id.toString() + character.name),
      ),
    );
  }
}
