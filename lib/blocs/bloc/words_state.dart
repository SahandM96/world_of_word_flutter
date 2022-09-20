part of 'words_bloc.dart';

@immutable
abstract class WordsState {}

class WordsInitial extends WordsState {}

class WordsLoading extends WordsState {}

class WordsLoaded extends WordsState {
  final List<Word> apiResult;
  WordsLoaded({
    required this.apiResult,
  });
}

class WordsError extends WordsState {}
