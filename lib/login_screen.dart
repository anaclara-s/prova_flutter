import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';
import 'custom_elevated_button.dart';
import 'custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final Uri _url = Uri.parse('https://www.google.com.br');

  // _launchURL() async {
  //   final url = Uri.parse('https://www.google.com.br');
  //   if (await canLaunch(url.toString())) {
  //     await launch(url.toString());
  //   } else {
  //     throw 'Não foi possivel iniciar: $url';
  //   }
  // }

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
                    maxLength: 20,
                    keyboardType: TextInputType.text,
                    prefixIcon:
                        Icon(Icons.person, color: kLoginScreenIconColor),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onDoubleTap: _launchURL,
                child: Text(
                  'Política de Privacidade',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
