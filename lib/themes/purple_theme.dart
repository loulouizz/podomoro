import 'package:flutter/material.dart';

ThemeData purpleTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    background: Colors.purple[100]!,
    primary: Colors.purple[800]!,
    secondary: Colors.purple[900]!,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.purple[800]!, // Define a cor da appbar como roxo
  ),
);