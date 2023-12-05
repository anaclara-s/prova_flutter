import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_elevated_button.dart';
import 'custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kDarkBackgroudColor,
              kLightBackgroudColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(
                text: 'Usuário',
                maxLength: 20,
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.person, color: kLoginScreenIconColor),
              ),
              CustomTextFormField(
                text: 'Senha',
                maxLength: 20,
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.lock, color: kLoginScreenIconColor),
              ),
              CustomElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
