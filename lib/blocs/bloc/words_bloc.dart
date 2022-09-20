// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:world_of_words/models/word.dart';
import 'package:world_of_words/repo/words_repo.dart';

part 'words_event.dart';
part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  final WordsRepo wordsRepo;
  WordsBloc(this.wordsRepo) : super(WordsInitial()) {
    on<WordsEvent>((event, emit) async {
      if (event is LoadWordsDataEvent) {
        emit(WordsLoading());
        List<Word>? apiResult = await wordsRepo.getAllWords();
        if (apiResult == null) {
          emit(WordsError());
        } else {
          emit(WordsLoaded(apiResult: apiResult));
        }
      }
    });
  }
}
