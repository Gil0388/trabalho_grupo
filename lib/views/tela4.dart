import 'package:flutter/material.dart';

import '../styles/styles.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController dadosnutelcpfCtrl = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    bool isEmail(String input) {
      final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return emailRegExp.hasMatch(input);
    }

    bool isCPF(String input) {
      return input.length == 9;
    }

    bool isPhone(String input) {
      // Assuming phone number validation here
      return input.isNotEmpty;
    }

    String validateInput(String? input) {
      if (input == null || input.isEmpty) {
        return 'Por favor, digite o dado correto.';
      } else if (isEmail(input) || isCPF(input) || isPhone(input)) {
        return 'Por favor, verifique seu e-mail com os dados enviados';
      }
      return '';
    }

    return Scaffold(
      backgroundColor: const Color(0xffA901F7),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 250),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Esqueceu sua Senha?',
                          style: TextStyle(
                              color: white,
                              fontFamily: 'Montserrat',
                              fontSize: 25),
                        ),
                        Container(padding: const EdgeInsets.only(top: 55)),
                        Container(padding: const EdgeInsets.only(top: 35)),
                        TextFormField(
                          style: const TextStyle(
                            fontFamily: 'Tahoma',
                            fontSize: 20,
                            color: Color(0xff3101B9),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: textFormFieldDecorator(
                              'Número de telefone, email ou CPF'),
                          controller: dadosnutelcpfCtrl,
                          validator: validateInput,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            formKey.currentState?.validate() == false
                                ? 'Por favor, digite o dado correto'
                                : '',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(padding: const EdgeInsets.only(top: 85)),
                        FilledButton(
                          style: buttonStyle,
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              // print(
                              //     'Por favor, verifique seu e-mail com os dados enviados');
                            }
                          },
                          child: const Text(
                            'Redefinir Senha',
                            style: TextStyle(
                              color: white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Já possuí cadastro?',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Login');
            },
            child: const Text(
              'Clique aqui',
              style: TextStyle(color: Colors.yellow, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
