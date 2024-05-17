import 'package:finals_trainyourmath/pages/ChooseDifficulty.dart';
import 'package:finals_trainyourmath/pages/MainMenuScreen.dart';
import 'package:finals_trainyourmath/pages/Options.dart';
import 'package:finals_trainyourmath/pages/Pause.dart';
import 'package:finals_trainyourmath/pages/Score.dart';
import 'package:finals_trainyourmath/pages/difficulty/PlayGameEasy.dart';
import 'package:finals_trainyourmath/pages/difficulty/PlayGameHard.dart';
import 'package:finals_trainyourmath/pages/difficulty/PlayGameMed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => const MainMenu(),
      '/ChooseDifficulty':(context) => const Difficulty(),
      '/Pause':(context) => const Pause(),
      '/PlayGameEasy':(context) => const PlayGameEasy(),
      '/PlayGameMed':(context) => const PlayGameMed(),
      '/PlayGameHard':(context) => const PlayGameHard(),
      '/Score':(context) => const Score(),
    },
  ));
}
