import 'package:flutter/material.dart';
import 'package:trabalho_grupo/views/tela1.dart';
import 'package:trabalho_grupo/views/tela3.dart';
import 'package:trabalho_grupo/views/tela2.dart';
import 'package:trabalho_grupo/views/tela4.dart';
import 'package:trabalho_grupo/views/tela5.dart';
import 'package:trabalho_grupo/views/tela6.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trabalho em Grupo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/tela1': (context) => FirstPage(),
        '/tela2': (context) => SecondPage(),
        '/tela3': (context) => ThreetPage(),
        '/tela4': (context) => FourthPage(),
        '/tela6': (context) => SixthPage(),
      },

      initialRoute: '/tela1',
    );
  }}