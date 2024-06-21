import 'package:flutter/material.dart';
import 'package:trabalho_grupo/data/local/session_datasource.dart';

import 'package:trabalho_grupo/views/login_page.dart';
import 'package:trabalho_grupo/views/sign_up_success.dart';
import 'package:trabalho_grupo/views/sign_up_page.dart';
import 'package:trabalho_grupo/views/tela4.dart';
import 'package:trabalho_grupo/views/tela5.dart';
import 'package:trabalho_grupo/views/tela6.dart';

const baseUrl = 'https://todo.rafaelbarbosatec.com/api/';
SessionDatasource sessionDatasource = SessionDatasource();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sessionDatasource.init();
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
        '/Login': (context) => const LoginPage(),
        '/SignUp': (context) => const SignUpPage(),
        '/SignUpSuccess': (context) => const SignUpSuccessPage(),
        '/tela4': (context) => const FourthPage(),
        '/tela5': (context) => const ListPage(),
        '/tela6': (context) => const SixthPage(),
      },
      initialRoute: '/Login',
    );
  }
}
