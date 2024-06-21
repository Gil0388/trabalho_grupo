import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_grupo/controller/todos_controller.dart';
import 'package:trabalho_grupo/data/local/session_datasource.dart';
import 'package:trabalho_grupo/data/model/todo_repository.dart';

import 'package:trabalho_grupo/views/login_page.dart';
import 'package:trabalho_grupo/views/tela3.dart';
import 'package:trabalho_grupo/views/sign_up_page.dart';
import 'package:trabalho_grupo/views/tela4.dart';
import 'package:trabalho_grupo/views/list_page.dart';
import 'package:trabalho_grupo/views/tela6.dart';

const baseUrl = 'https://todo.rafaelbarbosatec.com/api/';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final  sessionDataSource = SessionDatasource();
  await sessionDataSource.init();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => TodoRepository(Dio()),
        ),
        ChangeNotifierProvider(
          create: (context) => TodosController(
            todoRepository: context.read(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Trabalho em Grupo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/Login': (context) => const LoginPage(),
          '/SignUp': (context) => const SignUpPage(),
          '/CadastroConcluido': (context) => const ThreetPage(),
          '/tela4': (context) => const FourthPage(),
          '/listPage': (context) => const ListPage(),
          '/tela6': (context) => const SixthPage(),
        },
        initialRoute: '/Login',
      ),
    );
  }
}
