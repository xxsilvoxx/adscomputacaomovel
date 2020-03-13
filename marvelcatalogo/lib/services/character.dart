import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:marvelcatalogo/constants/constants.dart';
import 'package:marvelcatalogo/models/character.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';
import 'package:marvelcatalogo/models/response_character.dart';

class CharacterService {
  final limit = 50;
  final offset = 0;
  final url = ConstsAPI.marvelApiUrl + '/v1/public/characters';

  Future<List<Character>> getListCharacter() async {
    final hoje = DateTime.now().millisecondsSinceEpoch.toString();
    final hash =
        generateMd5(hoje + ConstsAPI.privateApikey + ConstsAPI.publicApiKey);

    Map<String, String> queryParameters = {
      'apikey': ConstsAPI.publicApiKey,
      'hash': hash,
      'ts': hoje,
      'limit': limit.toString(),
      'offset': offset.toString()
    };

    try {
      Response response =
          await Dio().get(url, queryParameters: queryParameters);
      final jsonValue = jsonDecode(response.toString());
      final object = CharacterDataWrapper.fromJson(jsonValue);
      return object.data.results;
    } catch (e) {
      print(e);
    }
  }

  generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
