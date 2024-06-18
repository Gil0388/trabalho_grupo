import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_grupo/controller/login_controller.dart';
import 'package:trabalho_grupo/core/dio_client.dart';
import 'package:trabalho_grupo/data/local/session_datasource.dart';
import 'package:trabalho_grupo/data/user_repository.dart';

import 'package:trabalho_grupo/views/login_page.dart';
import 'package:trabalho_grupo/views/tela3.dart';
import 'package:trabalho_grupo/views/sing_up_page.dart';
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
        '/Login': (context) => ChangeNotifierProvider(
              create: (context) => LoginController(
                  userRepository: UserRepository(DioClient.create()),
                  sessionDatasource: SessionDatasource()),
              builder: (context, child) => const LoginPage(),
            ),
        '/SignUp': (context) => ChangeNotifierProvider(
            create: (context) => LoginController(
                userRepository: UserRepository(DioClient.create()),
                sessionDatasource: sessionDatasource),
            builder: (context, child) => const SignUpPage()),
        '/CadastroConcluido': (context) => const ThreetPage(),
        '/tela4': (context) => const FourthPage(),
        '/tela5': (context) => const FivePage(),
        '/tela6': (context) => const SixthPage(),
      },
      initialRoute: '/Login',
    );
  }
}
