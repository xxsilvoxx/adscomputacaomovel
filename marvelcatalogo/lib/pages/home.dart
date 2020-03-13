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
      setState(() {
        characters = characters;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel catálogo'),
      ),
      body: Container(
        child: characters.length > 0
            ? ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return Text(characters[index].name);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
