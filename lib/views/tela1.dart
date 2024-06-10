import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trabalho_grupo/controller/login_controller.dart';
import 'package:trabalho_grupo/views/tela2.dart';
import 'package:trabalho_grupo/views/tela5.dart';

import '../styles/styles.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  late LoginController _loginController;

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    double topContainerHeight = MediaQuery.of(context).size.width / 2;
    Radius radius = Radius.circular(topContainerHeight);
    const SizedBox bigSpacer = SizedBox(height: 30);
    const SizedBox mediumSpacer = SizedBox(height: 10);
    _loginController = context.read<LoginController>();

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
                borderRadius:
                    BorderRadius.only(bottomLeft: radius, bottomRight: radius)),
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
                      color: purple, fontFamily: 'Montserrat', fontSize: 12),
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
                            color: yellow, fontSize: 12, fontFamily: 'Tahoma'),
                      ),
                    ),
                  ],
                ),
                FilledButton(
                  style: buttonStyle,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (usernameCtrl.text == fakeUser[0] &&
                          passwordCtrl.text == fakeUser[1]) {
                        _loginController.changeError(false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FivePage()));
                      } else {
                        _loginController.changeError(true);
                      }
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
                ListenableBuilder(
                  listenable: _loginController,
                  builder: (context, child) {
                    // bool showError = _loginController.showError;
                    return Visibility(
                      visible: _loginController.showError,
                      child: const Text(
                        'Login ou Senha incorreta, por favor tentar novamente',
                        style: TextStyle(
                            color: yellow, fontSize: 12, fontFamily: 'Tahoma'),
                      ),
                    );
                  },
                )
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
                        Navigator.pushNamed(context, '/tela2');
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
      ),
    );
  }
}

List<String> fakeUser = ['conta', '123456'];
