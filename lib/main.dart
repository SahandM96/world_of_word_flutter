import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_of_words/blocs/bloc/words_bloc.dart';

import 'package:world_of_words/repo/words_repo.dart';
import 'package:world_of_words/screens/bottom_bar.dart';

void main() {
  runApp(BlocProvider<WordsBloc>(
    create: (context) => WordsBloc(WordsRepo()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Game',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const BottomBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
