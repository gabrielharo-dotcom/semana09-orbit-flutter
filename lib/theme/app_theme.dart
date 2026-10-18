import 'package:flutter/material.dart';

const azul = Color(0xFF315CF5);
const tinta = Color(0xFF14213D);
const fondo = Color(0xFFF5F7FC);
const lima = Color(0xFFD9F779);

// Tema global: los widgets heredan estos estilos desde MaterialApp.
ThemeData crearTema() => ThemeData(
  useMaterial3: true,
  fontFamily: 'OrbitRoboto',
  colorScheme: ColorScheme.fromSeed(
    seedColor: azul,
    primary: azul,
    surface: Colors.white,
  ),
  scaffoldBackgroundColor: fondo,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 34,
      height: 1.15,
      fontWeight: FontWeight.w800,
      color: tinta,
      letterSpacing: -1.2,
    ),
    headlineSmall: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w800,
      color: tinta,
      letterSpacing: -.7,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: tinta,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: tinta,
    ),
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF657089), height: 1.5),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: fondo,
    foregroundColor: tinta,
    centerTitle: false,
    elevation: 0,
    scrolledUnderElevation: 0,
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.all(18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFFE3E7F0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Color(0xFFE3E7F0)),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: azul,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 54),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textStyle: const TextStyle(
        fontFamily: 'OrbitRoboto',
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(double.infinity, 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
  ),
);
