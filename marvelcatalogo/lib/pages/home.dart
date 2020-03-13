import 'package:flutter/material.dart';
import 'package:marvelcatalogo/models/character.dart';
import 'package:marvelcatalogo/services/character.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CharacterService characterService = new CharacterService();
  List<Character> characters = [];
  @override
  void initState() {
    characterService.getListCharacter().then((characters) {
      characters = characters;
    });
    super.initState();
  }

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
