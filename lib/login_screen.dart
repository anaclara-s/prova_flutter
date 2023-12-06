import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_align.dart';
import 'custom_elevated_button.dart';
import 'custom_text_form_field.dart';
import 'information_capture_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kDarkBackgroudColor,
                kLightBackgroudColor,
              ],
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      text: 'Usuário',
                      controller: _userController,
                      maxLength: 20,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(Icons.person,
                          color: kLoginScreenIconColor),
                      validator: (value) {
                        String trimmedValue = value!.trim();
                        print('Usuário após trim:$trimmedValue');
                        if (trimmedValue.isEmpty) {
                          return 'Por favor insira o usuário';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      text: 'Senha',
                      controller: _passwordController,
                      maxLength: 20,
                      keyboardType: TextInputType.text,
                      prefixIcon:
                          const Icon(Icons.lock, color: kLoginScreenIconColor),
                      validator: (value) {
                        String trimmedValue = value!.trim();
                        print('Senha após trim:$trimmedValue');
                        if (trimmedValue.isEmpty) {
                          return 'Por favor insira a senha';
                        }
                        if (trimmedValue.length < 2) {
                          return 'A senha deve ter pelo menos 2 caracteres';
                        }
                        if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(trimmedValue)) {
                          return 'A senha não pode ter caracteres especiais';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const InformationCaptureScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: CustomAlign(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
