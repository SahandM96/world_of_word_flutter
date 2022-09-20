import 'dart:convert';
import 'dart:io';

import 'package:world_of_words/models/create_and_update_word_request.dart';
import 'package:world_of_words/models/word.dart';
import 'package:world_of_words/services/my_client.dart';

abstract class WordService{
  Future<List<Word>> getAllWords();
  Future<List<Word>> getWordsByTag(Word word);
  Future<List<Word>> getWordsByCategory(Word word);
  Future<Word> getWordByName(Word word);
  Future<Word> getWordById(Word word);
  Future<Word> createWord(CreateAndUpdateWordRequest request);
  Future<Word> updateWord(CreateAndUpdateWordRequest request);
}
class BaseWordService implements WordService{

  final MyClient _client;

  static MyClient buildDefaultClient(){
    return MyHttpClient("localhost:6969");
  }
  BaseWordService(this._client);

  @override
  Future<Word> createWord(CreateAndUpdateWordRequest request) async{
    try{
      final response = await _client.post("words", request.toJson());
      final json = jsonDecode(response.body) as Map;
      return Word.fromJson(json);
    }catch(e){
      throw _formatException(e);
    }

  }

  @override
  Future<List<Word>> getAllWords()  async{
    try{
      final response = await _client.get("words");
      final json = jsonDecode(response.body) as List;
      return json.map((e)=> Word.fromJson(e)).toList();
    }catch (e){
      throw _formatException(e);
    }

  }

  @override
  Future<Word> getWordById(Word word) async{
    try{
      final response = await _client.post("wordsById",word.toJson());
      final json = jsonDecode(response.body) as Map;
      return Word.fromJson(json);
    }catch (e){
      throw _formatException(e);
    }
  }

  @override
  Future<Word> getWordByName(Word word) async{
    try{
      final response = await _client.post("wordsByName",word.toJson());
      final json = jsonDecode(response.body) as Map;
      return Word.fromJson(json);
    }catch (e){
      throw _formatException(e);
    }
  }

  @override
  Future<List<Word>> getWordsByCategory(Word word) async{
    try{
      final response = await _client.post("wordsByCategory",word.toJson());
      final json = jsonDecode(response.body) as List;
      return json.map((e)=> Word.fromJson(e)).toList();
    }catch (e) {
      throw _formatException(e);
    }
  }

  @override
  Future<List<Word>> getWordsByTag(Word word) async {
    try{
      final response = await _client.post("wordsByTag",word.toJson());
      final json = jsonDecode(response.body) as List;
      return json.map((e)=> Word.fromJson(e)).toList();
    }catch (e) {
      throw _formatException(e);
    }
  }

  @override
  Future<Word> updateWord(CreateAndUpdateWordRequest request) async{
    try{
      final response = await _client.post("wordUpdate",request.toJson());
      final json = jsonDecode(response.body) as Map;
      return Word.fromJson(json);
    }catch (e){
      throw _formatException(e);
    }
  }

  WordServiceException _formatException(e){
    if (e is SocketException){
      return WordServiceException("No internet");
    }

    if (e is HttpException){
      return WordServiceException("Request failed");

    }
    if (e is FormatException){
      return WordServiceException("Bad Request Data");
    }
    return WordServiceException("Unknown Error");
  }
}

class WordServiceException {
  final String message;

  WordServiceException(this.message);
}