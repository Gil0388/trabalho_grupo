import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:trabalho_grupo/controller/login_controller.dart';
import 'package:trabalho_grupo/core/dio_client.dart';
import 'package:trabalho_grupo/data/user_repository.dart';

import '../main.dart';
import '../styles/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  late LoginController _loginController;

  bool showError = false;

  @override
  void initState() {
    super.initState();
    _loginController = LoginController(
        userRepository: UserRepository(DioClient.create()),
        sessionDatasource: sessionDatasource);
  }

  @override
  Widget build(BuildContext context) {
    double topContainerHeight = MediaQuery.of(context).size.width / 2;
    Radius radius = Radius.circular(topContainerHeight);

    return ListenableBuilder(
      listenable: _loginController,
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: pink,
            resizeToAvoidBottomInset: false,
            appBar: // LOGO DA LOVEPEOPLE E NOME
                PreferredSize(
              preferredSize: Size.fromHeight(topContainerHeight),
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: radius, bottomRight: radius)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/lovepeople_logo.png',
                      height: 100,
                    ),
                    const Text(
                      'Lovepeople',
                      style: TextStyle(
                          color: purple,
                          fontFamily: 'Montserrat',
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // FORMULARIO DE LOGIN
                    const Text(
                      'Quem bom que voltou!',
                      style: TextStyle(
                          color: white, fontFamily: 'Montserrat', fontSize: 20),
                    ),
                    bigSpacer,
                    TextFormField(
                      decoration: textFormFieldDecorator(
                          'Número de telefone, email ou CPF'),
                      controller: usernameCtrl,
                      validator: (username) {
                        if (username == null || username.isEmpty) {
                          return 'Please provide a valid username';
                        }
                        return null;
                      },
                    ),
                    mediumSpacer,
                    TextFormField(
                      decoration: textFormFieldDecorator('Senha'),
                      obscureText: true,
                      controller: passwordCtrl,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Provide a valid password';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Esqueceu seu login ou senha? ',
                          style: TextStyle(
                              color: white, fontSize: 12, fontFamily: 'Tahoma'),
                        ),
                        TextButton(
                          onPressed: () {
                            //inclusão da rota já tem cadastro 09/06/2024
                            Navigator.pushNamed(context, '/tela4');
                          },
                          child: const Text(
                            'Clique aqui',
                            style: TextStyle(
                                color: yellow,
                                fontSize: 12,
                                fontFamily: 'Tahoma'),
                          ),
                        ),
                      ],
                    ),
                    FilledButton(
                      style: buttonStyle,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // _loginController.changeError(false);
                          _loginController.doSignIn(
                            email: usernameCtrl.text,
                            password: passwordCtrl.text,
                            onSuccess: () {
                              Navigator.pushNamed(context, '/tela5');
                            },
                            onError: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Login ou Senha incorreta, por favor tentar novamente')));
                            },
                          );
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          color: white,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: 65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const DottedLine(dashColor: white),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Não possui cadastro?',
                          style: TextStyle(
                              color: white, fontSize: 14, fontFamily: 'Tahoma'),
                        ),
                        TextButton(
                          //inclusão da rota cadastro 09/06/2024
                          onPressed: () {
                            Navigator.pushNamed(context, '/SignUp');
                          },
                          child: const Text(
                            'Clique aqui',
                            style: TextStyle(
                                color: yellow,
                                fontSize: 14,
                                fontFamily: 'Tahoma'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
