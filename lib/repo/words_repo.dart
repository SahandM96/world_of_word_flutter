import 'dart:convert';
import 'dart:io';

import 'package:world_of_words/models/create_and_update_word_request.dart';
import 'package:world_of_words/models/word.dart';
import 'package:http/http.dart' as http;

class WordsRepo {
  Map<String, String> get _headers => {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
  Future<List<Word>?> getAllWords() async {
    String url = "https://words.sahandm96.com/words";
    final result = await http.Client().get(Uri.parse(url));
    if (result.statusCode != 200) {
      return null;
    } else {
      Iterable dt = jsonDecode(utf8.decode(result.bodyBytes));
      List<Word> dataModel = [];
      for (var d in dt) {
        Word word = Word.fromJson(d);
        dataModel.add(word);
      }
      return dataModel;
    }
  }

  Future<List<Word>?> getWordsByCategory(Map<String, dynamic> cat) async {
    String url = "https://words.sahandm96.com/wordsByCategory";

    final result =
        await http.Client().post(Uri.parse(url), headers: _headers, body: cat);
    if (result.statusCode != 200) {
      return null;
    } else {
      Iterable dt = jsonDecode(result.body);
      List<Word> dataModel = [];
      for (var d in dt) {
        Word word = Word.fromJson(d);
        dataModel.add(word);
      }
      return dataModel;
    }
  }

  Future<List<Word>?> getWordsByTag(Map<String, dynamic> tag) async {
    String url = "https://words.sahandm96.com/wordsByTag";

    final result =
        await http.Client().post(Uri.parse(url), headers: _headers, body: tag);
    if (result.statusCode != 200) {
      return null;
    } else {
      Iterable dt = jsonDecode(result.body);
      List<Word> dataModel = [];
      for (var d in dt) {
        Word word = Word.fromJson(d);
        dataModel.add(word);
      }
      return dataModel;
    }
  }

  Future<Word?> getWordsByName(Map<String, dynamic> name) async {
    String url = "https://words.sahandm96.com/wordsByName";

    final result =
        await http.Client().post(Uri.parse(url), headers: _headers, body: name);
    if (result.statusCode != 200) {
      return null;
    } else {
      Word dataModel = Word.fromJson(result.body);
      return dataModel;
    }
  }

  Future<Word?> getWordsById(Map<String, dynamic> id) async {
    String url = "https://words.sahandm96.com/wordsById";

    final result =
        await http.Client().post(Uri.parse(url), headers: _headers, body: id);
    if (result.statusCode != 200) {
      return null;
    } else {
      Word dataModel = Word.fromJson(result.body);
      return dataModel;
    }
  }

  createWord(CreateAndUpdateWordRequest request) {}

  updateWord(CreateAndUpdateWordRequest word) {}
}
