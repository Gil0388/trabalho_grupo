import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:trabalho_grupo/core/dio_client.dart';
import 'package:trabalho_grupo/data/user_repository.dart';

import '../controller/login_controller.dart';
import '../main.dart';
import '../styles/styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  late LoginController _loginController;
  @override
  void initState() {
    super.initState();
    _loginController = LoginController(
        userRepository: UserRepository(DioClient.create()),
        sessionDatasource: sessionDatasource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      resizeToAvoidBottomInset: false,
      body: ListenableBuilder(
          listenable: _loginController,
          builder: (context, child) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        const Text(
                          'Vamos começar!',
                          style: TextStyle(
                              color: white,
                              fontFamily: 'Montserrat',
                              fontSize: 25),
                        ),
                        bigSpacer,
                        TextFormField(
                          decoration: textFormFieldDecorator('Nome'),
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
                          decoration: textFormFieldDecorator(
                              'Número de telefone, email ou CPF'),
                          controller: emailCtrl,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please provide a valid email';
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
                              return 'Please provide a valid password';
                            } else if (passwordCtrl.text !=
                                confirmPasswordCtrl.text) {
                              return 'The password does not match';
                            }
                            return null;
                          },
                        ),
                        mediumSpacer,
                        TextFormField(
                          decoration: textFormFieldDecorator('Confirmar senha'),
                          controller: confirmPasswordCtrl,
                          obscureText: true,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please provide a valid password';
                            }
                            return null;
                          },
                        ),
                        bigSpacer,
                        FilledButton(
                          style: buttonStyle,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _loginController.doSignUp(
                                username: usernameCtrl.text,
                                email: emailCtrl.text,
                                password: passwordCtrl.text,
                                onSuccess: () {
                                  Navigator.pushNamed(
                                      context, '/SignUpSuccess');
                                },
                                onError: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Um error aconteceu, por favor tentar novamente')));
                                },
                              );
                            }
                          },
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: white,
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: Column(
          children: [
            const DottedLine(dashColor: white),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Já possuí cadastro?',
                    style: TextStyle(
                        color: white, fontSize: 14, fontFamily: 'Tahoma'),
                  ),
                  TextButton(
                    onPressed: () {
                      //inclusão da rota já tem cadastro 09/06/2024
                      Navigator.pushNamed(context, '/Login');
                    },
                    child: const Text(
                      'Clique aqui',
                      style: TextStyle(
                          color: yellow, fontSize: 14, fontFamily: 'Tahoma'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
