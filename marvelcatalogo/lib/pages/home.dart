import 'package:flutter/material.dart';
import 'package:marvelcatalogo/models/character.dart';
import 'package:marvelcatalogo/services/character.dart';
import 'package:marvelcatalogo/shared/my_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CharacterService characterService = new CharacterService();
  List<Character> _characters = [];

  @override
  void initState() {
    characterService.getListCharacter().then((characters) {
      setState(() {
        _characters = characters;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Marvel catálogo'),
      ),
      body: Container(
        child: _characters.length > 0
            ? ListView.builder(
                itemCount: _characters.length,
                itemBuilder: (context, index) {
                  final character = _characters[index];
                  return _criaItemLista(character);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _criaItemLista(Character character) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detalhes', arguments: character);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/place_holder.jpg',
                image:
                    '${character.thumbnail.path}.${character.thumbnail.extension}',
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(character.name),
              subtitle: Text(character.description != null &&
                      character.description.isNotEmpty
                  ? character.description
                  : 'Não possui descrição'),
              trailing: IconButton(
                icon: Icon(Icons.star),
                onPressed: () => print('Clicou!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
